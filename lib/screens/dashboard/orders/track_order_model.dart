import 'dart:convert';

import 'package:yamu/screens/dashboard/home/model/home_banner.dart';

CartTotalModel cartTotalModelFromJson(String str) => CartTotalModel.fromJson(json.decode(str));

String cartTotalModelToJson(CartTotalModel data) => json.encode(data.toJson());

class CartTotalModel {
  List<Message> message;
  List<Tracking> tracking;

  CartTotalModel({
    required this.message,
    required this.tracking,
  });

  factory CartTotalModel.fromJson(Map<String, dynamic> json) => CartTotalModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    tracking: List<Tracking>.from(json["tracking"].map((x) => Tracking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "tracking": List<dynamic>.from(tracking.map((x) => x.toJson())),
  };
}

class Tracking {
  String orderHistoryId;
  String orderId;
  String orderStatusId;
  String notify;
  String comment;
  DateTime dateAdded;
  String orderStatus;

  Tracking({
    required this.orderHistoryId,
    required this.orderId,
    required this.orderStatusId,
    required this.notify,
    required this.comment,
    required this.dateAdded,
    required this.orderStatus,
  });

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
    orderHistoryId: json["order_history_id"],
    orderId: json["order_id"],
    orderStatusId: json["order_status_id"],
    notify: json["notify"],
    comment: json["comment"],
    dateAdded: DateTime.parse(json["date_added"]),
    orderStatus: json["order_status"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "order_history_id": orderHistoryId,
    "order_id": orderId,
    "order_status_id": orderStatusId,
    "notify": notify,
    "comment": comment,
    "date_added": dateAdded.toIso8601String(),
    "order_status": orderStatus,
  };
}
