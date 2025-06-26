import 'package:compras/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/ui/view/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeView({
    super.key,
    required this.viewModel,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compras'),
        elevation: 5,
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Nenhuma compra cadastrada'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newShopping,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _newShopping() {
    context.push(Routes.newShopping.path);
  }
}
