import 'dart:convert';

import 'package:yamu/screens/dashboard/home/model/home_banner.dart';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  List<Message> message;
  List<Order> orders;

  ProductsModel({
    required this.message,
    required this.orders,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
  String orderId;
  String name;
  String status;
  String dateAdded;
  int products;
  String total;

  Order({
    required this.orderId,
    required this.name,
    required this.status,
    required this.dateAdded,
    required this.products,
    required this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    name: json["name"],
    status: json["status"],
    dateAdded: json["date_added"],
    products: json["products"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "name": name,
    "status": status,
    "date_added": dateAdded,
    "products": products,
    "total": total,
  };
}
