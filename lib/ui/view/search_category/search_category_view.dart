import 'dart:developer';

import 'package:compras/domain/models/category/category_model.dart';
import 'package:compras/ui/core/themes/dimens.dart';
import 'package:compras/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/domain/dto/category_subcategory/category_subcategory_dto.dart';
import '/ui/view/search_category/search_category_view_model.dart';

class SearchCategoryView extends StatefulWidget {
  final String? catgoryId;
  final String? subCategoryId;
  final SearchCategoryViewModel viewModel;

  const SearchCategoryView({
    super.key,
    this.catgoryId,
    this.subCategoryId,
    required this.viewModel,
  });

  @override
  State<SearchCategoryView> createState() => _SearchCategoryViewState();
}

class _SearchCategoryViewState extends State<SearchCategoryView> {
  late final SearchCategoryViewModel _viewModel;
  final _controller = TextEditingController();

  final _results = ValueNotifier<List<CategorySubcategoryDto>>([]);

  final _showCategories = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _viewModel = widget.viewModel;
    _viewModel.search.addListener(_searchedName);
  }

  @override
  void dispose() {
    _viewModel.search.removeListener(_searchedName);

    _showCategories.dispose();
    _results.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.of(context);
    final screenHeight = MediaQuery.sizeOf(context).height;

    log('Height: $screenHeight');
    log((screenHeight * .15).toString());
    log((screenHeight * .7).toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisar Categorias'),
        leading: IconButton(
          onPressed: _backPage,
          icon: Icon(Symbols.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                onChanged: _searchName,
                decoration: const InputDecoration(
                  labelText: 'Entre com uma categoria ou subcategoria',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            ListenableBuilder(
              listenable: Listenable.merge([_results, _showCategories]),
              builder: (context, _) {
                final results = _results.value;

                if (_viewModel.search.running) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: _showCategories.value ? 138 : screenHeight * .7,
                    child: ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final selected = results[index];
                        return Card(
                          child: ListTile(
                            title: Text(selected.toString()),
                            onTap: () => _onItemTapped(selected),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            Divider(),
            TextButton(
              onPressed: () {
                _showCategories.value = !_showCategories.value;
              },
              child: const Text('Pre-selecionar uma Categoria'),
            ),
            ValueListenableBuilder(
              valueListenable: _showCategories,
              builder: (context, value, child) {
                return Visibility(
                  visible: value,
                  child: Wrap(
                    spacing: dimens.spacingHorizontal,
                    alignment: WrapAlignment.center,
                    children: [
                      for (final category in _viewModel.categories)
                        ElevatedButton(
                          child: Text(category.name),
                          onPressed: () => _onCategoryTapped(category),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onCategoryTapped(CategoryModel category) {
    _results.value.clear();

    final subcategories = _viewModel.subCategoriesList(category.id);

    final List<CategorySubcategoryDto> newResults = [];
    for (final subcategory in subcategories) {
      final dto = CategorySubcategoryDto(
        category: category,
        subcategory: subcategory,
      );
      newResults.add(dto);
    }
    _results.value = newResults;
    _showCategories.value = false;
  }

  void _onItemTapped(CategorySubcategoryDto selected) {
    GoRouter.of(context).pop<CategorySubcategoryDto>(selected);
  }

  void _backPage() {
    GoRouter.of(context).pop<CategorySubcategoryDto>(null);
  }

  void _searchName(String value) {
    if (_viewModel.search.running) return;
    final text = value.trim();
    if (text.isEmpty) return;

    _viewModel.search.execute(text);
  }

  void _searchedName() {
    if (_viewModel.search.running) return;

    final result = _viewModel.search.result!;

    switch (result) {
      case Success(value: final results):
        _results.value = results;
        break;
      case Failure():
        break;
    }
  }
}
