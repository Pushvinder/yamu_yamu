import 'dart:convert';

import 'package:yamu/screens/dashboard/home/model/home_banner.dart';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  List<Message> message;
  List<Product> products;

  ProductsModel({
    required this.message,
    required this.products,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    products: List<Product>.from(json["latest_products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "latest_products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  String productId;
  String name;
  String additionalName;
  String description;
  String rating;
  String reviews;
  String thumb;
  String quantity;
  String price;
  String special;
  String storeId;
  String cartId;
  String dateAdded;
  String dateModified;

  Product({
    required this.productId,
    required this.name,
    required this.additionalName,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.thumb,
    required this.quantity,
    required this.price,
    required this.special,
    required this.storeId,
    required this.cartId,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"] ?? '',
    name: json["name"] ?? '',
    additionalName: json["additional_name"] ?? '',
    description: json["description"] ?? '',
    rating: json["rating"].toString(),
    reviews: json["reviews"].toString(),
    thumb: json["thumb"] ?? '',
    quantity: json["quantity"].toString() ?? '',
    price: json["price"].toString()??'',
    special: json["special"] == null || json["special"].toString() == 'false' ? '' :json["special"].toString()??'',
    storeId: json["store_id"] ?? '',
    cartId: json["cart_id"] ?? '',
    dateAdded: json["date_added"] ?? '',
    dateModified: json["date_modified"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "name": name,
    "additional_name": additionalName,
    "description": description,
    "rating": rating,
    "reviews": reviews,
    "thumb": thumb,
    "quantity": quantity,
    "price": price,
    "special": special,
    "store_id": storeId,
    "cart_id": cartId,
    "date_added": dateAdded,
    "date_modified": dateModified,
  };
}

