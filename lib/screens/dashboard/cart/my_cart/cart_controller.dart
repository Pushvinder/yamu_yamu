import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/cart/checkout/order_success_view.dart';
import 'package:yamu/screens/dashboard/cart/my_cart/model/cart_total_model.dart';
import 'package:yamu/screens/dashboard/home/model/products_model.dart';

class CartController extends GetxController {
  var localStorage = LocalStorage();
  final apiProvider = ApiProvider();
  RxList<Product> cartList = <Product>[].obs;

  var cartDetails = CartDetail().obs;
  var couponController = TextEditingController();
  var addressController = TextEditingController();

  var loader = true.obs;

  @override
  void onInit() {
    getCartProductsList();
    getCartTotal();
    super.onInit();
  }

  void getCartProductsList() {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint = '${ApiRoutes.getCart}$customerId&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        loader.value = false;
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          cartList.value = List<Product>.from(
              result['customer_cart'].map((x) => Product.fromJson(x)));
          loader.value = false;
        } else {
          loader.value = false;
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      loader.value = false;
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void getCartTotal() {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint = '${ApiRoutes.getCartTotal}$customerId&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          cartDetails.value = CartDetail.fromJson(result["cart_detail"]);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void applyCoupon(String code) {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint =
        '${ApiRoutes.applyCoupon}$customerId&coupon=$code&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          cartDetails.value = CartDetail.fromJson(result["cart_detail"]);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void updateQuantity(int index, {required bool increase}) {
    var quantity = '';
    if (cartList.value[index].quantity.isEmpty) {
      return;
    }
    var currentQuantity = int.parse(cartList.value[index].quantity);
    if (increase) {
      currentQuantity++;
    } else {
      if (currentQuantity > 1) {
        currentQuantity--;
      }
    }
    quantity = currentQuantity.toString();
    var formData = FormData({'quantity': quantity});
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint =
        '${ApiRoutes.updateQuantity}$customerId&cart_id=${cartList.value[index].cartId}&api_key=222222';
    apiProvider.postApi(endPoint, formData).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          cartList.value[index].quantity = quantity;
          cartList.refresh();
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void deleteFromCart(int index) {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint =
        '${ApiRoutes.removeCart}$customerId&cart_id=${cartList.value[index].cartId}&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          cartList.removeAt(index);
          cartList.refresh();
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void applyShipping(shipping) {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var request =
        FormData({'shipping': shipping, 'shipping_title': 'Flat Rate'});
    var endPoint = '${ApiRoutes.applyShipping}$customerId&api_key=222222';
    apiProvider.postApi(endPoint, request).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          cartDetails.value = CartDetail.fromJson(result["cart_detail"]);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void checkout() {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var request =
    FormData({'payment_method[title]': 'COD', 'comment': ''});
    var endPoint = '${ApiRoutes.checkout}$customerId&api_key=222222';
    apiProvider.postApi(endPoint, request).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          Get.to(const OrderSuccessView());
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }
}
