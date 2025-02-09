import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/products_viewmodel.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<ProductsViewModel>(
        builder: (context, model, child) => ListView(
          children: [
            const DrawerHeader(
              child: Text(
                'Filters',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text('Price Range'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    margin: const EdgeInsets.only(bottom: 22),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Min: ₹${model.minPrice.round()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Max: ₹${model.maxPrice.round()}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  RangeSlider(
                    values: RangeValues(model.minPrice, model.maxPrice),
                    min: 0,
                    max: 1000,
                    divisions: 20,
                    labels: RangeLabels(
                      '₹${model.minPrice.round()}',
                      '₹${model.maxPrice.round()}',
                    ),
                    onChanged: (RangeValues values) {
                      model.setPriceRange(values.start, values.end);
                    },
                    activeColor: const Color.fromARGB(255, 26, 25, 25),
                    overlayColor:
                        WidgetStatePropertyAll(Colors.white.withOpacity(0.1)),
                    inactiveColor: Colors.grey,
                    mouseCursor:
                        const WidgetStatePropertyAll(SystemMouseCursors.click),
                  ),
                ],
              ),
            ),
            // Add more filters here
          ],
        ),
      ),
    );
  }
}
