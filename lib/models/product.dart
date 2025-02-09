class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    this.rating = 0.0,
  }) : imageUrl =
            'https://dummyjson.com/image/400x200/008080/ffffff?text=$name&fontSize=16';
}
