import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/info_card.dart';

class DetailScreen extends StatelessWidget {
  final ProductModel product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                product.image,
                height: 250.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 32.0),
            Row(
              children: [
                infoCard('Price', product.price.toString()),
                infoCard('City', product.city),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                infoCard('Presenter', product.presenter),
                infoCard('Rate', product.rate.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
