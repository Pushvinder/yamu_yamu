import 'dart:convert';

import 'package:yamu/screens/dashboard/home/model/home_banner.dart';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  List<Message> message;
  OrderDetail orderDetail;

  OrderDetailsModel({
    required this.message,
    required this.orderDetail,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    orderDetail: OrderDetail.fromJson(json["order_detail"]),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "order_detail": orderDetail.toJson(),
  };
}

class OrderDetail {
  String orderId;
  String points;
  String invoiceNo;
  String invoicePrefix;
  String storeName;
  String customerId;
  String firstname;
  String lastname;
  String telephone;
  String email;
  String totalItems;
  String paymentMethod;
  dynamic paymentReceipt;
  PaymentAddress paymentAddress;
  ShippingAddress shippingAddress;
  List<OrderItem> orderItems;
  Total total;

  OrderDetail({
    required this.orderId,
    required this.points,
    required this.invoiceNo,
    required this.invoicePrefix,
    required this.storeName,
    required this.customerId,
    required this.firstname,
    required this.lastname,
    required this.telephone,
    required this.email,
    required this.totalItems,
    required this.paymentMethod,
    required this.paymentReceipt,
    required this.paymentAddress,
    required this.shippingAddress,
    required this.orderItems,
    required this.total,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    orderId: json["order_id"],
    points: json["points"].toString(),
    invoiceNo: json["invoice_no"],
    invoicePrefix: json["invoice_prefix"],
    storeName: json["store_name"],
    customerId: json["customer_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    telephone: json["telephone"],
    email: json["email"],
    totalItems: json["total_items"],
    paymentMethod: json["payment_method"],
    paymentReceipt: json["payment_receipt"]??'',
    paymentAddress: PaymentAddress.fromJson(json["payment_address"]),
    shippingAddress: ShippingAddress.fromJson(json["shipping_address"]),
    orderItems: List<OrderItem>.from(json["order_items"].map((x) => OrderItem.fromJson(x))),
    total: Total.fromJson(json["total"]),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "points": points,
    "invoice_no": invoiceNo,
    "invoice_prefix": invoicePrefix,
    "store_name": storeName,
    "customer_id": customerId,
    "firstname": firstname,
    "lastname": lastname,
    "telephone": telephone,
    "email": email,
    "total_items": totalItems,
    "payment_method": paymentMethod,
    "payment_receipt": paymentReceipt,
    "payment_address": paymentAddress.toJson(),
    "shipping_address": shippingAddress.toJson(),
    "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
    "total": total.toJson(),
  };
}

class OrderItem {
  String orderProductId;
  String name;
  String image;
  String quantity;
  String price;
  String total;

  OrderItem({
    required this.orderProductId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.total,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    orderProductId: json["order_product_id"]??'',
    name: json["name"]??'',
    image: json["image"]??'',
    quantity: json["quantity"]??'',
    price: json["price"]??'',
    total: json["total"]??'',
  );

  Map<String, dynamic> toJson() => {
    "order_product_id": orderProductId,
    "name": name,
    "image": image,
    "quantity": quantity,
    "price": price,
    "total": total,
  };
}

class PaymentAddress {
  String paymentFirstname;
  String paymentLastname;
  String paymentCompany;
  String paymentAddress1;
  String paymentAddress2;
  String paymentPostcode;
  String paymentCity;
  String paymentZoneId;
  String paymentZone;
  String paymentZoneCode;
  String paymentCountryId;
  String paymentCountry;
  String paymentIsoCode2;
  String paymentIsoCode3;
  String paymentAddressFormat;

  PaymentAddress({
    required this.paymentFirstname,
    required this.paymentLastname,
    required this.paymentCompany,
    required this.paymentAddress1,
    required this.paymentAddress2,
    required this.paymentPostcode,
    required this.paymentCity,
    required this.paymentZoneId,
    required this.paymentZone,
    required this.paymentZoneCode,
    required this.paymentCountryId,
    required this.paymentCountry,
    required this.paymentIsoCode2,
    required this.paymentIsoCode3,
    required this.paymentAddressFormat,
  });

  factory PaymentAddress.fromJson(Map<String, dynamic> json) => PaymentAddress(
    paymentFirstname: json["payment_firstname"],
    paymentLastname: json["payment_lastname"],
    paymentCompany: json["payment_company"],
    paymentAddress1: json["payment_address_1"],
    paymentAddress2: json["payment_address_2"],
    paymentPostcode: json["payment_postcode"],
    paymentCity: json["payment_city"],
    paymentZoneId: json["payment_zone_id"],
    paymentZone: json["payment_zone"],
    paymentZoneCode: json["payment_zone_code"],
    paymentCountryId: json["payment_country_id"],
    paymentCountry: json["payment_country"],
    paymentIsoCode2: json["payment_iso_code_2"],
    paymentIsoCode3: json["payment_iso_code_3"],
    paymentAddressFormat: json["payment_address_format"],
  );

  Map<String, dynamic> toJson() => {
    "payment_firstname": paymentFirstname,
    "payment_lastname": paymentLastname,
    "payment_company": paymentCompany,
    "payment_address_1": paymentAddress1,
    "payment_address_2": paymentAddress2,
    "payment_postcode": paymentPostcode,
    "payment_city": paymentCity,
    "payment_zone_id": paymentZoneId,
    "payment_zone": paymentZone,
    "payment_zone_code": paymentZoneCode,
    "payment_country_id": paymentCountryId,
    "payment_country": paymentCountry,
    "payment_iso_code_2": paymentIsoCode2,
    "payment_iso_code_3": paymentIsoCode3,
    "payment_address_format": paymentAddressFormat,
  };
}

class ShippingAddress {
  String shippingFirstname;
  String shippingLastname;
  String shippingCompany;
  String shippingAddress1;
  String shippingAddress2;
  String shippingPostcode;
  String shippingCity;
  String shippingZoneId;
  String shippingZone;
  String shippingZoneCode;
  String shippingCountryId;
  String shippingCountry;
  String shippingIsoCode2;
  String shippingIsoCode3;
  String shippingAddressFormat;

  ShippingAddress({
    required this.shippingFirstname,
    required this.shippingLastname,
    required this.shippingCompany,
    required this.shippingAddress1,
    required this.shippingAddress2,
    required this.shippingPostcode,
    required this.shippingCity,
    required this.shippingZoneId,
    required this.shippingZone,
    required this.shippingZoneCode,
    required this.shippingCountryId,
    required this.shippingCountry,
    required this.shippingIsoCode2,
    required this.shippingIsoCode3,
    required this.shippingAddressFormat,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
    shippingFirstname: json["shipping_firstname"],
    shippingLastname: json["shipping_lastname"],
    shippingCompany: json["shipping_company"],
    shippingAddress1: json["shipping_address_1"],
    shippingAddress2: json["shipping_address_2"],
    shippingPostcode: json["shipping_postcode"],
    shippingCity: json["shipping_city"],
    shippingZoneId: json["shipping_zone_id"],
    shippingZone: json["shipping_zone"],
    shippingZoneCode: json["shipping_zone_code"],
    shippingCountryId: json["shipping_country_id"],
    shippingCountry: json["shipping_country"],
    shippingIsoCode2: json["shipping_iso_code_2"],
    shippingIsoCode3: json["shipping_iso_code_3"],
    shippingAddressFormat: json["shipping_address_format"],
  );

  Map<String, dynamic> toJson() => {
    "shipping_firstname": shippingFirstname,
    "shipping_lastname": shippingLastname,
    "shipping_company": shippingCompany,
    "shipping_address_1": shippingAddress1,
    "shipping_address_2": shippingAddress2,
    "shipping_postcode": shippingPostcode,
    "shipping_city": shippingCity,
    "shipping_zone_id": shippingZoneId,
    "shipping_zone": shippingZone,
    "shipping_zone_code": shippingZoneCode,
    "shipping_country_id": shippingCountryId,
    "shipping_country": shippingCountry,
    "shipping_iso_code_2": shippingIsoCode2,
    "shipping_iso_code_3": shippingIsoCode3,
    "shipping_address_format": shippingAddressFormat,
  };
}

class Total {
  String? subTotal;
  String? flatShippingRate;
  String? coupon2222;
  String? total;

  Total({
     this.subTotal,
     this.flatShippingRate,
    this.coupon2222,
    this.total,
  });

  factory Total.fromJson(Map<String, dynamic> json) => Total(
    subTotal: json["Sub-Total"].toString(),
    flatShippingRate: json["Flat Shipping Rate"].toString(),
    coupon2222: json["Coupon (2222)"].toString(),
    total: json["Total"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "Sub-Total": subTotal,
    "Flat Shipping Rate": flatShippingRate,
    "Coupon (2222)": coupon2222,
    "Total": total,
  };
}
