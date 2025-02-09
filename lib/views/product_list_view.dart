import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/products_viewmodel.dart';
import '../widgets/product_card.dart';
import '../widgets/filter_drawer.dart';

class ProductListView extends StatelessWidget {
  final String category;

  const ProductListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final viewModel = ProductsViewModel();
        viewModel.fetchProducts(category); // Pass the category here
        return viewModel;
      },
      child: Consumer<ProductsViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(category),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
            ],
          ),
          endDrawer: const FilterDrawer(),
          body: model.busy
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: model.products.length,
                  itemBuilder: (context, index) => ProductCard(
                    product: model.products[index],
                  ),
                ),
        ),
      ),
    );
  }
}
