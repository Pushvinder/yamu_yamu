import 'dart:convert';

import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/screens/dashboard/home/model/products_model.dart';

class WishlistController extends GetxController{

  var localStorage = LocalStorage();
  final apiProvider = ApiProvider();
  RxList<Product> wishlistProductList = <Product>[].obs;

  @override
  void onInit() {
    getWishlistProductsList();
    super.onInit();
  }

  void getWishlistProductsList() {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint = '${ApiRoutes.getWishlist}$customerId&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          wishlistProductList.value = List<Product>.from(
              result['customer_wishlist'].map((x) => Product.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }


  void addProductToCart(String productId) {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint =
        '${ApiRoutes.addToCart}$customerId&api_key=222222';
    var formData = FormData({
      'product_id':productId,
      'quantity' : '1'
    });
    apiProvider.postApi(endPoint,formData).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          CommonUi.showNotificationToast('Success', result['message'][0]['msg']);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void removeProductToWishlist(String productId, int index) {

    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint =
        '${ApiRoutes.addToWishlist}$customerId&product_id=$productId&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          wishlistProductList.value.removeAt(index);
          wishlistProductList.refresh();
          CommonUi.showNotificationToast('Success', result['message'][0]['msg']);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }
}