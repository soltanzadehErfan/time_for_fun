import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  bool isLoading = true;

  List<ProductModel> get products => _products;

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(
        'https://66e20997c831c8811b57050e.mockapi.io/api/v1/home/items'));

    if (response.statusCode == 200) {
      final List<dynamic> productData = json.decode(response.body);
      _products =
          productData.map((json) => ProductModel.fromJson(json)).toList();
      isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
