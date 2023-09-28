import 'dart:convert';

ProductReviewModel productReviewModelFromJson(String str) => ProductReviewModel.fromJson(json.decode(str));

String productReviewModelToJson(ProductReviewModel data) => json.encode(data.toJson());

class ProductReviewModel {
  List<Message> message;
  List<ProductReview> productReviews;

  ProductReviewModel({
    required this.message,
    required this.productReviews,
  });

  factory ProductReviewModel.fromJson(Map<String, dynamic> json) => ProductReviewModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    productReviews: List<ProductReview>.from(json["product_reviews"].map((x) => ProductReview.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "product_reviews": List<dynamic>.from(productReviews.map((x) => x.toJson())),
  };
}

class Message {
  String msg;
  bool msgStatus;

  Message({
    required this.msg,
    required this.msgStatus,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    msg: json["msg"],
    msgStatus: json["msg_status"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "msg_status": msgStatus,
  };
}

class ProductReview {
  String productId;
  String productName;
  String author;
  String text;
  String rating;
  String dateAdded;

  ProductReview({
    required this.productId,
    required this.productName,
    required this.author,
    required this.text,
    required this.rating,
    required this.dateAdded,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) => ProductReview(
    productId: json["product_id"] ?? '',
    productName: json["product_name"] ?? '',
    author: json["author"] ?? '',
    text: json["text"] ?? '',
    rating: json["rating"].toString(),
    dateAdded: json["date_added"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "author": author,
    "text": text,
    "rating": rating,
    "date_added": dateAdded,
  };
}
