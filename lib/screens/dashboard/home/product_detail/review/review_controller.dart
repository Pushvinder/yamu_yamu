import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';

class ReviewController extends GetxController{

  var localStorage = LocalStorage();
  final apiProvider = ApiProvider();

  var productName = ''.obs;
  var productImage = ''.obs;
  var productAdditionalName = ''.obs;
  var productId = ''.obs;
  var rating = '3'.obs;
  var commentController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getProductData();
  }

  void getProductData() {
    productId.value = Get.parameters['id']!;
    productName.value = Get.parameters['name']!;
    productImage.value = Get.parameters['image']!;
    productAdditionalName.value = Get.parameters['name2']!;
  }

  void submitReview() {
    if(commentController.text.isEmpty){
      CommonUi.showNotificationToast('Alert', 'Please enter your comment');
      return;
    }
    var formData  = FormData({
      'review':commentController.text,
      'rating':rating.value
    });
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint = '${ApiRoutes.productReview}$productId&customer_id=$customerId&api_key=222222';
    apiProvider.postApi(endPoint,formData).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          Get.back();
          CommonUi.showNotificationToast(
              'Success', result['message'][0]['msg']);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

}