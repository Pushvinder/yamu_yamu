import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  List<Message> message;
  List<Banner> banner;

  BannerModel({
    required this.message,
    required this.banner,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
    "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
  };
}

class Banner {
  String bannerId;
  String name;
  String title;
  String link;
  String image;

  Banner({
    required this.bannerId,
    required this.name,
    required this.title,
    required this.link,
    required this.image,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    bannerId: json["banner_id"],
    name: json["name"],
    title: json["title"],
    link: json["link"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "banner_id": bannerId,
    "name": name,
    "title": title,
    "link": link,
    "image": image,
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
