import 'dart:convert';
import 'package:get/get.dart';
import 'package:yamu/constants/CommonUi.dart';

class ApiProvider extends GetConnect {
  var liveUrl = 'https://yamuindia.com/index.php?route=extension/gwsocapi/module/';


  Future<String> postApi(String route, FormData request) async {
    var response = await post(liveUrl + route, request);
    if (response.statusCode == 200) {
      return jsonEncode(response.body);
    } else {
      return 'error';
    }
  }

  Future<String> getApi(String route, {setHeaders = true}) async {
    var response = await get(liveUrl+route);
    if (response.statusCode == 200) {
      return jsonEncode(response.body);
    } else {
      return 'error';
    }
  }
}
