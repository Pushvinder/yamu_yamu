import 'dart:convert';

import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/screens/dashboard/home/model/products_model.dart';
import 'package:yamu/screens/dashboard/profile/promos/coupon_model.dart';

class PromoController extends GetxController{
  final apiProvider = ApiProvider();
  RxList<Coupon> couponsList = <Coupon>[].obs;

  var openFrom = ''.obs;
  @override
  void onInit() {
    super.onInit();
    openFrom.value = Get.arguments ?? '';
    getCouponsList();
  }

  void getCouponsList() {
    var endPoint = ApiRoutes.getCoupons;
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          couponsList.value = List<Coupon>.from(
              result['coupons'].map((x) => Coupon.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

}