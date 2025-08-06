import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

class ApiService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('${Constants.baseUrl}/products'));

    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        return jsonData.map((product) => Product.fromJson(product)).toList();
      } catch (e) {
        throw Exception('Failed to parse JSON: $e');
      }
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}

class Product {
  final int id;
  final String name;
  final String description;

  Product({required this.id, required this.name, required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
