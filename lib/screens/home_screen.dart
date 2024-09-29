import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../screens/detail_screen.dart';
import '../widgets/product_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const SpinKitFadingCube(
                color: Colors.blue,
                duration: Duration(seconds: 1),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Animate(
                  effects: const [FadeEffect(),MoveEffect()],
                  delay: const Duration(milliseconds: 200),
                  child: const Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 6.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                const Divider(
                  indent: 64.0,
                  endIndent: 64.0,
                ),
                const SizedBox(height: 16.0),
                ProductCarousel(
                  products: provider.products,
                  onProductTap: (product) {
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
