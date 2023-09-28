import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';

class EditProfileController extends GetxController {
  var localStorage = LocalStorage();
  final apiProvider = ApiProvider();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final gstController = TextEditingController();
  final shopNameController = TextEditingController();

  var showLoader = false.obs;

  // var profileImage = ''.obs;

  @override
  void onInit() {
    getUserProfile();
  }

  void getUserProfile() {
    var profileData = jsonDecode(localStorage.getAProfile());
    firstNameController.text = profileData['firstname'];
    lastNameController.text = profileData['lastname'];
    emailController.text = profileData['email'];
    phoneNoController.text = profileData['telephone'];
    gstController.text = profileData['gst_number'];
    shopNameController.text = profileData['shop_name'];
  }

  void updateProfile() {
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

    showLoader.value = true;
    FormData formData = FormData({
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'email': emailController.text,
      'telephone': phoneNoController.text,
      'shop_name': shopNameController.text,
      'gst_number': gstController.text,
    });
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint = '${ApiRoutes.editCustomer}$customerId&api_key=222222';
    apiProvider.postApi(endPoint, formData).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          LocalStorage().saveProfile(jsonEncode(result['customer'][0]));
          Get.back();
          CommonUi.showNotificationToast(
              'Success', result['message'][0]['msg']);
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
