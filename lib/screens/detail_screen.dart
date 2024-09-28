import 'package:flutter/material.dart';
import '../models/product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.image),
            const SizedBox(height: 16),
            Text('Price: ${product.price}', style: const TextStyle(fontSize: 18)),
            Text('City: ${product.city}', style: const TextStyle(fontSize: 18)),
            Text('Presenter: ${product.presenter}', style: const TextStyle(fontSize: 18)),
            Text('Rate: ${product.rate}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}