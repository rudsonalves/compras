import 'package:compras/ui/view/home/home_view_model.dart';
import 'package:flutter/material.dart';

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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
