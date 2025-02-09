import 'package:flutter/material.dart';
import '../models/product.dart';
import '../views/product_detail_view.dart';

class SearchResults extends StatelessWidget {
  final List<Product> results;

  const SearchResults({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final product = results[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                'https://dummyjson.com/image/50x50/008080/ffffff?text=${product.name}&fontSize=12',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.shopping_bag),
              ),
            ),
            title: Text(product.name),
            subtitle: Text('₹${product.price.toStringAsFixed(0)}'),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailView(product: product),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
