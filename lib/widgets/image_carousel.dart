import 'package:flutter/material.dart';
import '../models/product.dart';

class ImageCarousel extends StatefulWidget {
  final Product product;

  const ImageCarousel({
    super.key,
    required this.product,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of colors for dummy images
  final List<String> colors = [
    '008080',
    'FF5733',
    '4CAF50',
    '2196F3',
    '9C27B0'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return Image.network(
                'https://dummyjson.com/image/400x200/${colors[index]}/ffffff?text=${widget.product.name}&fontSize=16',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              );
            },
          ),
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              colors.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
