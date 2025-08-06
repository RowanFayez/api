import '../models/product.dart';
import '../../core/api_service.dart';

class ProductRepository {
  final ApiService _api = ApiService();

  Future<List<Product>> getAllProducts() async {
    final data = await _api.fetchProducts();
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<Product> getProductDetail(int id) async {
    final json = await _api.fetchProductDetail(id);
    return Product.fromJson(json);
  }
}
