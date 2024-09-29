import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      // Shuffle products randomly for initial display
      _products.shuffle(Random());

      // Load last tapped product ID from shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? lastTappedProductId = prefs.getString('lastTappedProductId');

      if (lastTappedProductId != null) {
        // Find the product with the last tapped ID and move it to the front
        int index = _products.indexWhere((product) => product.id == lastTappedProductId);
        if (index != -1) {
          final lastTappedProduct = _products.removeAt(index);
          _products.insert(0, lastTappedProduct);
        }
      }

      isLoading = false;
    } catch (error) {
      isLoading = false;
      throw Exception('Failed to load products');
    } finally {
      notifyListeners();
    }
  }

  void setLastTappedProductId(String productId) async {
    // Save the last tapped product ID to shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastTappedProductId', productId);
    notifyListeners(); // Notify listeners of changes
  }
}