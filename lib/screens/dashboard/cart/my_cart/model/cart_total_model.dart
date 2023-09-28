// To parse this JSON data, do
//
//     final cartTotalModel = cartTotalModelFromJson(jsonString);

import 'dart:convert';

import 'package:yamu/screens/dashboard/home/model/home_banner.dart';

CartTotalModel cartTotalModelFromJson(String str) => CartTotalModel.fromJson(json.decode(str));

String cartTotalModelToJson(CartTotalModel data) => json.encode(data.toJson());

class CartTotalModel {
  List<Message> message;
  CartDetail cartDetail;

  CartTotalModel({
    required this.message,
    required this.cartDetail,
  });

  factory CartTotalModel.fromJson(Map<String, dynamic> json) => CartTotalModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    cartDetail: CartDetail.fromJson(json["cart_detail"]),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "cart_detail": cartDetail.toJson(),
  };
}

class CartDetail {
  String? subTotal;
  String? shipping;
  String? shippingTitle;
  String? couponCode;
  String? couponAmount;
  String? tax;
  String? taxPercentage;
  String? taxTitle;
  String? total;

  CartDetail({
     this.subTotal,
     this.shipping,
     this.shippingTitle,
     this.couponCode,
    this.couponAmount,
     this.tax,
     this.taxPercentage,
     this.taxTitle,
     this.total,
  });

  factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
    subTotal: json["sub_total"].toString(),
    shipping: json["shipping"].toString(),
    shippingTitle: json["shipping_title"].toString(),
    couponCode: json["coupon_code"].toString(),
    couponAmount: json["coupon_amount"].toString(),
    tax: json["tax"].toString(),
    taxPercentage: json["tax_percentage"].toString(),
    taxTitle: json["tax_title"].toString(),
    total: json["total"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "sub_total": subTotal,
    "shipping": shipping,
    "shipping_title": shippingTitle,
    "coupon_code": couponCode,
    "coupon_amount": couponAmount,
    "tax": tax,
    "tax_percentage": taxPercentage,
    "tax_title": taxTitle,
    "total": total,
  };
}
