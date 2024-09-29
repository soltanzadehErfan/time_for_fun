import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  bool isLoading = true;

  List<ProductModel> get products => _products;

  final ApiService _apiService = ApiService();

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      _products = await _apiService.fetchProducts();
      isLoading = false;
    } catch (error) {
      throw Exception('Failed to load products');
    } finally {
      notifyListeners();
    }
  }
}
