import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String? selectedSize;
  final ValueChanged<String> onSizeSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: sizes.map((size) {
        final isSelected = size == selectedSize;
        return InkWell(
          onTap: () => onSizeSelected(size),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.yellow : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              size,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}