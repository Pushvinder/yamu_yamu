import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/routes/Routes.dart';

class LoginController extends GetxController {
  final apiProvider = ApiProvider();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var showLoader = false.obs;

  void loginUser() {
    if (emailController.text.isEmpty) {
      CommonUi.showNotificationToast('Alert', 'Please enter your email');
      return;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      CommonUi.showNotificationToast('Alert', 'Please enter valid email');
      return;
    }

    if (passwordController.text.isEmpty) {
      CommonUi.showNotificationToast('Alert', 'Please enter your password');
      return;
    }

    showLoader.value = true;
    FormData formData = FormData({
      'email': emailController.text,
      'password': passwordController.text,
    });

    apiProvider.postApi(ApiRoutes.login, formData).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          LocalStorage().saveProfile(jsonEncode(result['customer'][0]));
          Get.offAllNamed(Routes().dashboard);
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
