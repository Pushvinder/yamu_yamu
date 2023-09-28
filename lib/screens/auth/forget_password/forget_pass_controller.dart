import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/routes/Routes.dart';

class ForgetPassController extends GetxController {
  final apiProvider = ApiProvider();

  final phoneNo = TextEditingController();
  var showLoader = false.obs;

  void forgetPassword() {
    if (phoneNo.text.isEmpty) {
      CommonUi.showNotificationToast('Alert', 'Please enter your email');
      return;
    }

    showLoader.value = true;
    FormData formData = FormData({
      'phone': phoneNo.text,
    });

    apiProvider.postApi(ApiRoutes.forgetPassword, formData).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          Get.back();
          CommonUi.showNotificationToast('Success', result['message'][0]['msg']);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
      showLoader.value = false;
    }).catchError((error) {
      showLoader.value = false;
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }
}
