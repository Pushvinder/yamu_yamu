import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/screens/dashboard/profile/my_address/address_model.dart';

class MyAddressController extends GetxController {
  var localStorage = LocalStorage();
  final apiProvider = ApiProvider();
  RxList<CustomerAddress> addressList = <CustomerAddress>[].obs;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final companyController = TextEditingController();
  final addressOneController = TextEditingController();
  final addressTwoController = TextEditingController();
  final cityController = TextEditingController();
  final postcodeController = TextEditingController();

  var loader = false.obs;
  var openFrom = ''.obs;

  @override
  void onInit() {
    openFrom.value = Get.arguments ?? '';
    getAddressList();
    super.onInit();
  }

  addAddress() {
    var firstName = firstNameController.text;
    var lastName = lastNameController.text;
    var cmp = companyController.text;
    var address1 = addressOneController.text;
    var address2 = addressTwoController.text;
    var city = cityController.text;
    var postcode = postcodeController.text;

    if (firstName.isEmpty ||
        cmp.isEmpty ||
        address1.isEmpty ||
        city.isEmpty ||
        postcode.isEmpty) {
      CommonUi.showNotificationToast('Error', 'Please fill above filds');
      return;
    }
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];

    FormData request = FormData({
      'firstname': firstName,
      'lastname': lastName,
      'company': cmp,
      'address_1': address1,
      'address_2': address2,
      'city': city,
      'postcode': postcode,
    });
    loader.value = true;
    apiProvider
        .postApi('${ApiRoutes.addAddress}$customerId&api_key=222222', request)
        .then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          Get.back(result: 'added');
          clearFields();
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
      loader.value = false;
    }).catchError((error) {
      loader.value = false;
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void getAddressList() {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    apiProvider
        .getApi('${ApiRoutes.getAddress}$customerId&api_key=222222')
        .then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          addressList.value = List<CustomerAddress>.from(
              result['customer_address']
                  .map((x) => CustomerAddress.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void clearFields() {
    firstNameController.clear();
    lastNameController.clear();
    companyController.clear();
    addressOneController.clear();
    addressTwoController.clear();
    cityController.clear();
    postcodeController.clear();
  }

  void deleteAddress(String addressId, int index) {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint =
        '${ApiRoutes.removeAddress}$customerId&address_id=$addressId&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          addressList.removeAt(index);
          addressList.refresh();
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void getShippingByZone(String zoneId, String address) {
    // var endPoint = '${ApiRoutes.getShipping}$zoneId&api_key=222222';
    var endPoint = '${ApiRoutes.getShipping}1480&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
         var shipping = result['shipping_method']['flat']['quote']['flat']['cost'];
         Get.back(result:{'shipping':shipping,'address':address});
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }
}
