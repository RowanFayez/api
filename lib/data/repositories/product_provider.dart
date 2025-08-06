import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _repo = ProductRepository();

  List<Product>? _products;
  Product? _selected;
  bool _loading = false;

  List<Product>? get products => _products;
  Product? get selected => _selected;
  bool get loading => _loading;

  Future<void> loadProducts() async {
    _loading = true;
    notifyListeners();
    _products = await _repo.getAllProducts();
    _loading = false;
    notifyListeners();
  }

  Future<void> selectProduct(int id) async {
    _loading = true;
    notifyListeners();
    _selected = await _repo.getProductDetail(id);
    _loading = false;
    notifyListeners();
  }
}
