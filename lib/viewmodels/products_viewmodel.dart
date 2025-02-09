import '../core/base_viewmodel.dart';
import '../models/product.dart';

class ProductsViewModel extends BaseViewModel {
  List<Product> _products = [];
  String _selectedCategory = '';
  double _minPrice = 0;
  double _maxPrice = 1000;
  String _searchQuery = '';

  List<Product> get products => _products;
  String get selectedCategory => _selectedCategory;
  double get minPrice => _minPrice;
  double get maxPrice => _maxPrice;
  String get searchQuery => _searchQuery;

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setPriceRange(double min, double max) {
    _minPrice = min;
    _maxPrice = max;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> fetchProducts([String? category]) async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 1));

    final allProducts = [
      // T-shirts
      Product(
        id: '1',
        name: 'Vintage Band T-Shirt',
        description: 'Classic rock band merchandise from the 90s',
        price: 299,
        category: 'T-shirts',
      ),
      Product(
        id: '2',
        name: 'Retro Sports T-Shirt',
        description: 'Authentic sports team merchandise',
        price: 399,
        category: 'T-shirts',
      ),
      Product(
        id: '3',
        name: 'Designer Graphic Tee',
        description: 'Premium branded t-shirt in great condition',
        price: 499,
        category: 'T-shirts',
      ),

      // Shirts
      Product(
        id: '4',
        name: 'Classic Denim Shirt',
        description: 'Vintage denim button-down shirt',
        price: 599,
        category: 'Shirts',
      ),
      Product(
        id: '5',
        name: 'Floral Print Shirt',
        description: 'Retro summer pattern shirt',
        price: 449,
        category: 'Shirts',
      ),
      Product(
        id: '6',
        name: 'Checkered Cotton Shirt',
        description: 'Comfortable casual wear shirt',
        price: 349,
        category: 'Shirts',
      ),

      // Pants
      Product(
        id: '7',
        name: 'Vintage Jeans',
        description: 'Classic fit denim jeans',
        price: 799,
        category: 'Pants',
      ),
      Product(
        id: '8',
        name: 'Cargo Pants',
        description: 'Multi-pocket cargo trousers',
        price: 649,
        category: 'Pants',
      ),
      Product(
        id: '9',
        name: 'Cotton Palazzo',
        description: 'Comfortable wide-leg pants',
        price: 499,
        category: 'Pants',
      ),

      // Scarves
      Product(
        id: '10',
        name: 'Silk Dupatta',
        description: 'Elegant traditional dupatta',
        price: 299,
        category: 'Scarves',
      ),
      Product(
        id: '11',
        name: 'Printed Stole',
        description: 'Lightweight summer stole',
        price: 199,
        category: 'Scarves',
      ),
      Product(
        id: '12',
        name: 'Woolen Muffler',
        description: 'Warm winter scarf',
        price: 349,
        category: 'Scarves',
      ),

      // Traditional
      Product(
        id: '13',
        name: 'Cotton Kurti',
        description: 'Ethnic daily wear kurti',
        price: 399,
        category: 'Traditional',
      ),
      Product(
        id: '14',
        name: 'Block Print Saree',
        description: 'Vintage cotton saree',
        price: 899,
        category: 'Traditional',
      ),
      Product(
        id: '15',
        name: 'Embroidered Kurta',
        description: 'Traditional men\'s kurta',
        price: 599,
        category: 'Traditional',
      ),
    ];

    if (category == null || category == 'All Products') {
      _products = allProducts;
    } else {
      _products = allProducts.where((p) => p.category == category).toList();
    }

    setBusy(false);
    notifyListeners();
  }
}
