import 'dart:convert';

import 'package:foodmaniac/utils/constants.dart';

ProductElement productElementFromJson(String str) =>
    ProductElement.fromJson(json.decode(str));

String productElementToJson(ProductElement data) => json.encode(data.toJson());

class ProductElement {
  List<Product> products;
  Product product;

  ProductElement({
    this.products,
    this.product,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "product": product.toJson(),
      };
}

class Product {
  int id;
  double price;
  String name;
  String description;
  String image;

  Product({
    this.id,
    this.price,
    this.name,
    this.description,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"].toDouble(),
        name: json["name"],
        description: json["description"],
        image: json["image"] == null ? defaultImageUrl : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "name": name,
        "description": description,
        "image": image == null ? defaultImageUrl : image,
      };
}
