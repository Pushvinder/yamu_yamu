import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/home/model/products_model.dart';
import 'package:yamu/screens/dashboard/orders/order_mode.dart';

import 'track_order_model.dart';

class OrdersController extends GetxController{
  var localStorage = LocalStorage();
  final apiProvider = ApiProvider();
  RxList<Order> ordersList = <Order>[].obs;

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  void getOrders() {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint = '${ApiRoutes.getOrders}$customerId&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          ordersList.value = List<Order>.from(result['orders'].map((x) => Order.fromJson(x)));
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

 void cancelOrders(String orderId,int index) {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint = '${ApiRoutes.getOrders}$customerId&order_id=$orderId&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          Timer(const Duration(seconds: 1),(){
            getOrders();
          });
          ordersList.refresh();
           CommonUi.showNotificationToast('Alert', result['message'][0]['msg']);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void trackOrder(String orderId) {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint = '${ApiRoutes.trackOrder}$customerId&order_id=$orderId&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          var trackingData =  List<Tracking>.from(result["tracking"].map((x) => Tracking.fromJson(x)));
          Get.toNamed(Routes().trackOrder,arguments: trackingData);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

}