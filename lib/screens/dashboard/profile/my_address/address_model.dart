import 'dart:convert';

import 'package:yamu/screens/dashboard/home/model/home_banner.dart';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  List<Message> message;
  List<CustomerAddress> customerAddress;

  AddressModel({
    required this.message,
    required this.customerAddress,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    customerAddress: List<CustomerAddress>.from(json["customer_address"].map((x) => CustomerAddress.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "customer_address": List<dynamic>.from(customerAddress.map((x) => x.toJson())),
  };
}

class CustomerAddress {
  String addressId;
  String customerId;
  String firstname;
  String lastname;
  String company;
  String address1;
  String address2;
  String city;
  String postcode;
  String countryId;
  String zoneId;
  String customField;

  CustomerAddress({
    required this.addressId,
    required this.customerId,
    required this.firstname,
    required this.lastname,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.postcode,
    required this.countryId,
    required this.zoneId,
    required this.customField,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) => CustomerAddress(
    addressId: json["address_id"] ?? '',
    customerId: json["customer_id"] ?? '',
    firstname: json["firstname"] ?? '',
    lastname: json["lastname"] ?? '',
    company: json["company"] ?? '',
    address1: json["address_1"] ?? '',
    address2: json["address_2"] ?? '',
    city: json["city"] ?? '',
    postcode: json["postcode"] ?? '',
    countryId: json["country_id"] ?? '',
    zoneId: json["zone_id"] ?? '',
    customField: json["custom_field"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "address_id": addressId,
    "customer_id": customerId,
    "firstname": firstname,
    "lastname": lastname,
    "company": company,
    "address_1": address1,
    "address_2": address2,
    "city": city,
    "postcode": postcode,
    "country_id": countryId,
    "zone_id": zoneId,
    "custom_field": customField,
  };
}

