import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';

class SignUpController extends GetxController {
  final apiProvider = ApiProvider();

  //signup
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final gstController = TextEditingController();
  final shopNameController = TextEditingController();
  final passwordController = TextEditingController();

  // ready to go
  var otpValue = ''.obs;
  var phoneNumber = ''.obs;

  var showLoader = false.obs;

  void registerUser() {
    if (firstNameController.value.text.isEmpty) {
      CommonUi.showNotificationToast('Alert', 'Please enter user first name');
      return;
    }
    if (lastNameController.text.isEmpty) {
      CommonUi.showNotificationToast('Alert', 'Please enter user last name');
      return;
    }
    if (emailController.text.isEmpty) {
      CommonUi.showNotificationToast('Alert', 'Please enter your email');
      return;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      CommonUi.showNotificationToast('Alert', 'Please enter valid email');
      return;
    }
    if (phoneNoController.text.isEmpty) {
      CommonUi.showNotificationToast(
          'Alert', 'Please enter your mobile number');
      return;
    }
    if (shopNameController.text.isEmpty) {
      CommonUi.showNotificationToast('Alert', 'Please enter your shop name');
      return;
    }
    if (gstController.text.isEmpty) {
      CommonUi.showNotificationToast('Alert', 'Please enter your Gst number');
      return;
    }
    if (passwordController.text.isEmpty) {
      CommonUi.showNotificationToast('Alert', 'Please enter your password');
      return;
    }
    showLoader.value = true;
    FormData formData = FormData({
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'email': emailController.text,
      'telephone': phoneNoController.text,
      'shop_name': shopNameController.text,
      'gst_number': gstController.text,
      'password': passwordController.text,
    });
    phoneNumber.value = phoneNoController.text;
    apiProvider.postApi(ApiRoutes.register, formData).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          CommonUi.showNotificationToast('Success', result['message'][0]['msg']);
          Get.toNamed(Routes().readyToGo);
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

  void verifyOtp() {
    if (otpValue.value.isEmpty) {
      CommonUi.showNotificationToast('Alert', 'Please enter your Otp');
      return;
    }
    if (otpValue.value.length < 4) {
      CommonUi.showNotificationToast('Alert', 'Please enter valid Otp');
      return;
    }
    FormData formData = FormData({'otp': otpValue.value});
    showLoader.value = true;
    apiProvider.postApi(ApiRoutes.verifyOtp, formData).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          CommonUi.showNotificationToast('Success', result['message'][0]['msg']);
          Get.toNamed(Routes().profileComplete);
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
