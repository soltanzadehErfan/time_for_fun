class ProductModel {
  final String id;
  final String title;
  final String image;
  final String price;
  final String city;
  final String presenter;
  final String runtime;
  final String rate;
  final String url;

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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
