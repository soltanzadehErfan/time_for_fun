class Product {
  final String id;
  final String title;
  final String image;
  final String price;
  final String city;
  final String presenter;
  final String runtime;
  final String rate;
  final String url;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.city,
    required this.presenter,
    required this.runtime,
    required this.rate,
    required this.url,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'],
      city: json['city'],
      presenter: json['presenter'],
      runtime: json['runtime'],
      rate: json['rate'],
      url: json['url'],
    );
  }
}