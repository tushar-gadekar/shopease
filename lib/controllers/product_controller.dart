import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/product_model.dart';
import '../utils/mock_data.dart';

class ProductController extends GetxController {
  final _storage = GetStorage();
  
  var products = <ProductModel>[].obs;
  
  var filteredProducts = <ProductModel>[].obs;

  var searchQuery = ''.obs;
  var selectedCategory = ''.obs;
  
  var categories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadProducts();
    _loadFavorites();
  }

  void _loadProducts() {
    final mockProducts = MockData.getProducts();
    products.assignAll(mockProducts);
    filteredProducts.assignAll(mockProducts);
    
    final cats = mockProducts.map((p) => p.category).toSet().toList();
    cats.insert(0, 'All');
    categories.assignAll(cats);
  }

  void _loadFavorites() {
    List<dynamic>? savedFavs = _storage.read<List<dynamic>>('favorites');
    if (savedFavs != null) {
      for (var p in products) {
        if (savedFavs.contains(p.id)) {
          p.isFavorite.value = true;
        }
      }
    }
  }

  void toggleFavorite(ProductModel product) {
    product.isFavorite.value = !product.isFavorite.value;
    
    List<String> favIds = products
        .where((p) => p.isFavorite.value)
        .map((p) => p.id)
        .toList();
    _storage.write('favorites', favIds);
  }

  void searchProducts(String query) {
    searchQuery.value = query;
    _applyFilters();
  }

  void filterByCategory(String category) {
    selectedCategory.value = category == 'All' ? '' : category;
    _applyFilters();
  }

  void clearFilters() {
    searchQuery.value = '';
    selectedCategory.value = '';
    _applyFilters();
  }

  void _applyFilters() {
    var result = products.toList();

    if (searchQuery.value.isNotEmpty) {
      result = result
          .where((p) => p.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    if (selectedCategory.value.isNotEmpty) {
      result = result.where((p) => p.category == selectedCategory.value).toList();
    }

    filteredProducts.assignAll(result);
  }
}
