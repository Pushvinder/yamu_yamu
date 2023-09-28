
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/screens/dashboard/home/model/products_model.dart';

class SearchController extends GetxController{

  final apiProvider = ApiProvider();

  var searchController = TextEditingController().obs;

  RxList<Product> searchProductList = <Product>[].obs;

  void searchProduct(String value) {
    apiProvider.getApi('${ApiRoutes.searchProduct}$value&api_key=222222').then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        searchProductList.value.clear();
        searchProductList.refresh();
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          searchProductList.value = List<Product>.from(
              result['products'].map((x) => Product.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }


}