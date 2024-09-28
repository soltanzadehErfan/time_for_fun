import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onProductTap;

  const ProductCarousel({super.key, required this.products, required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        autoPlay: true,
        autoPlayCurve: Curves.easeInOut,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: products.map((product) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => onProductTap(product),
              child: Hero(
                tag: product.id,  // For smooth transition to detail screen
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          product.image,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.title,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        'Price: ${product.price}',
                        style: const TextStyle(color: Colors.teal, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}