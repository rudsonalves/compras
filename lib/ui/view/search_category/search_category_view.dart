import 'package:compras/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  List<CategorySubcategoryDto> _results = [];

  @override
  void initState() {
    super.initState();

    _viewModel = widget.viewModel;
    _viewModel.search.addListener(_searchedName);
  }

  @override
  void dispose() {
    _viewModel.search.removeListener(_searchedName);
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Categories')),
      body: Column(
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
            listenable: _viewModel.search,
            builder: (context, _) {
              if (_viewModel.search.running) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final selected = _results[index];
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
        ],
      ),
    );
  }

  void _onItemTapped(CategorySubcategoryDto selected) {
    GoRouter.of(context).pop<CategorySubcategoryDto>(selected);
    // Navigator.pop(context, selected);
  }

  void _searchName(String value) {
    if (_viewModel.search.running) return;
    final text = value.trim();
    if (text.isEmpty || text.length < 3) return;

    _viewModel.search.execute(text);
  }

  void _searchedName() {
    if (_viewModel.search.running) return;

    final result = _viewModel.search.result!;

    switch (result) {
      case Success(value: final results):
        setState(() {
          _results = results;
        });
        break;
      case Failure():
        break;
    }
  }
}
