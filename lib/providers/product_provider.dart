import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool isLoading = true;

  List<Product> get products => _products;

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://66e20997c831c8811b57050e.mockapi.io/api/v1/home/items'));

    if (response.statusCode == 200) {
      final List<dynamic> productData = json.decode(response.body);
      _products = productData.map((json) => Product.fromJson(json)).toList();
      isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }

  void moveToFirst(Product product) {
    _products.remove(product);
    _products.insert(0, product);
    notifyListeners();
  }
}