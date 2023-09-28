import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
  List<Message> message;
  List<Product> product;

  ProductDetailsModel({
    required this.message,
    required this.product,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    product: List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "product": List<dynamic>.from(product.map((x) => x.toJson())),
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

class Product {
  String productId;
  String name;
  String additionalName;
  String description;
  String quantity;
  String rating;
  String reviews;
  String thumb;
  String price;
  String special;
  String href;
  String minimum;
  List<Option> options;
  List<OtherImage> otherImages;

  Product({
    required this.productId,
    required this.name,
    required this.additionalName,
    required this.description,
    required this.quantity,
    required this.rating,
    required this.reviews,
    required this.thumb,
    required this.price,
    required this.special,
    required this.href,
    required this.minimum,
    required this.options,
    required this.otherImages,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"] ?? '',
    name: json["name"] ?? '',
    additionalName: json["additional_name"] ?? '',
    description: json["description"] ?? '',
    quantity: json["quantity"].toString() ?? '',
    rating: json["rating"].toString() ?? '',
    reviews: json["reviews"].toString() ?? '',
    thumb: json["thumb"] ?? '',
    price: json["price"].toString() ?? '',
    special: json["special"] == null || json["special"].toString() == 'false' ? '' :json["special"].toString()??'',
    href: json["href"].toString() ?? '',
    minimum: json["minimum"].toString() ?? '',
    options: !json.containsKey('options') ? [] : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    otherImages: !json.containsKey('other_images') ? [] : List<OtherImage>.from(json["other_images"].map((x) => OtherImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "name": name,
    "additional_name": additionalName,
    "description": description,
    "quantity": quantity,
    "rating": rating,
    "reviews": reviews,
    "thumb": thumb,
    "price": price,
    "special": special,
    "href": href,
    "minimum": minimum,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "other_images": List<dynamic>.from(otherImages.map((x) => x.toJson())),
  };
}

class OtherImage {
  String productImageId;
  String productId;
  String image;
  String sortOrder;

  OtherImage({
    required this.productImageId,
    required this.productId,
    required this.image,
    required this.sortOrder,
  });

  factory OtherImage.fromJson(Map<String, dynamic> json) => OtherImage(
    productImageId: json["product_image_id"],
    productId: json["product_id"],
    image: json["image"],
    sortOrder: json["sort_order"],
  );

  Map<String, dynamic> toJson() => {
    "product_image_id": productImageId,
    "product_id": productId,
    "image": image,
    "sort_order": sortOrder,
  };
}


class Option {
  String productOptionId;
  List<ProductOptionValue> productOptionValue;
  String optionId;
  String name;
  ProductOptionValue? selectedValue;

  Option({
    required this.productOptionId,
    required this.productOptionValue,
    required this.optionId,
    required this.name,
     this.selectedValue,
   });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    productOptionId: json["product_option_id"],
    productOptionValue: List<ProductOptionValue>.from(json["product_option_value"].map((x) => ProductOptionValue.fromJson(x))),
    optionId: json["option_id"],
    name: json["name"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "product_option_id": productOptionId,
    "product_option_value": List<dynamic>.from(productOptionValue.map((x) => x.toJson())),
    "option_id": optionId,
    "name": name,
  };
}

class ProductOptionValue {
  String productOptionValueId;
  String optionValueId;
  String name;
  String image;

  ProductOptionValue({
    required this.productOptionValueId,
    required this.optionValueId,
    required this.name,
    required this.image,
  });

  factory ProductOptionValue.fromJson(Map<String, dynamic> json) => ProductOptionValue(
    productOptionValueId: json["product_option_value_id"],
    optionValueId: json["option_value_id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "product_option_value_id": productOptionValueId,
    "option_value_id": optionValueId,
    "name": name,
    "image": image,
  };
}
