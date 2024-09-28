import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../screens/detail_screen.dart';
import '../widgets/product_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Carousel'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Featured Products',
                ),
                const SizedBox(height: 20),
                ProductCarousel(
                  products: provider.products,
                  onProductTap: (product) {
                    provider.moveToFirst(product);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(product: product),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}