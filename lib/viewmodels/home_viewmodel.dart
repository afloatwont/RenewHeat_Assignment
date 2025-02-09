import '../core/base_viewmodel.dart';
import '../models/product.dart';
import '../utils/dummy_products.dart';

class HomeViewModel extends BaseViewModel {
  List<Product> _searchResults = [];
  List<Product> get searchResults => _searchResults;

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    setBusy(true);

    final allProducts = getDummyProducts();
    final searchLower = query.toLowerCase();

    // Improved search algorithm
    _searchResults = allProducts.where((product) {
      final nameLower = product.name.toLowerCase();
      final descriptionLower = product.description.toLowerCase();
      final categoryLower = product.category.toLowerCase();

      // Check if any of the fields contain the search query
      return nameLower.contains(searchLower) ||
          descriptionLower.contains(searchLower) ||
          categoryLower.contains(searchLower);
    }).toList();

    setBusy(false);
    notifyListeners();
  }
}
