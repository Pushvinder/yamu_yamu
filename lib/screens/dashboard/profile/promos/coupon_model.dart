import 'dart:convert';

CouponModel couponModelFromJson(String str) => CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
  List<Message> message;
  List<Coupon> coupons;

  CouponModel({
    required this.message,
    required this.coupons,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    coupons: List<Coupon>.from(json["coupons"].map((x) => Coupon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "coupons": List<dynamic>.from(coupons.map((x) => x.toJson())),
  };
}

class Coupon {
  String couponId;
  String name;
  String code;
  String type;
  String discount;
  String logged;
  String shipping;
  String total;
  String dateStart;
  String dateEnd;
  String usesTotal;
  String usesCustomer;
  String status;

  Coupon({
    required this.couponId,
    required this.name,
    required this.code,
    required this.type,
    required this.discount,
    required this.logged,
    required this.shipping,
    required this.total,
    required this.dateStart,
    required this.dateEnd,
    required this.usesTotal,
    required this.usesCustomer,
    required this.status,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    couponId: json["coupon_id"]??'',
    name: json["name"]??'',
    code: json["code"]??'',
    type: json["type"]??'',
    discount: json["discount"]??'',
    logged: json["logged"]??'',
    shipping: json["shipping"]??'',
    total: json["total"]??'',
    dateStart: json["date_start"]??"",
    dateEnd: json["date_end"]??'',
    usesTotal: json["uses_total"]??'',
    usesCustomer: json["uses_customer"]??'',
    status: json["status"]??'',
  );

  Map<String, dynamic> toJson() => {
    "coupon_id": couponId,
    "name": name,
    "code": code,
    "type": type,
    "discount": discount,
    "logged": logged,
    "shipping": shipping,
    "total": total,
    "date_start": dateStart,
    "date_end": dateEnd,
    "uses_total": usesTotal,
    "uses_customer": usesCustomer,
    "status": status,
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
