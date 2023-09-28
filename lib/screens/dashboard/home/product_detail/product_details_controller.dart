import 'dart:convert';

import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/screens/dashboard/home/product_detail/model/product_review.dart';

import 'model/product_details_model.dart';

class ProductDetailsController extends GetxController {
  final apiProvider = ApiProvider();
  var localStorage = LocalStorage();

  RxList<ProductReview> reviewList = <ProductReview>[].obs;
  RxList<Product> relatedProductList = <Product>[].obs;

   Product? product = null;

  var loader = true.obs;
  var image = ''.obs;
  var tab = 0.obs;
  var quantity = ''.obs;

  @override
  void onInit() {
    super.onInit();
    var id = Get.arguments;
    getProductDetails(id);
    getProductReview(id);
    getRelatedProductsList(id);
  }

  void getRelatedProductsList(id) {
    apiProvider.getApi('${ApiRoutes.relatedProduct}$id&api_key=222222').then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          relatedProductList.value = List<Product>.from(
              result['related_products'].map((x) => Product.fromJson(x)));
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void getProductDetails(id) {
    apiProvider
        .getApi('${ApiRoutes.productDetails}$id&api_key=222222')
        .then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
        loader.value = false;
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          product = List<Product>.from(
              result['product'].map((x) => Product.fromJson(x)))[0];
          image.value = product!.thumb;
          quantity.value = product!.minimum;
          loader.value = false;
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
          loader.value = false;
        }
      }
    }).catchError((error) {
      loader.value = false;
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }


  void getProductReview(id) {
    apiProvider
        .getApi('${ApiRoutes.getReview}$id&api_key=222222')
        .then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          reviewList.value = List<ProductReview>.from(result["product_reviews"].map((x) => ProductReview.fromJson(x)));
        }
      }
      loader.value = false;
    }).catchError((error) {
      loader.value = false;
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void updateQuantity(bool increase) {
    if (quantity.value.isEmpty) {
      return;
    }
    var currentQuantity = int.parse(quantity.value);
    if (increase) {
      currentQuantity++;
    } else {
      if (currentQuantity > 1) {
        currentQuantity--;
      }
    }
    quantity.value = currentQuantity.toString();
  }

  void addProductToCart() {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint =
        '${ApiRoutes.addToCart}$customerId&api_key=222222';
    var map = {
      'product_id':product!.productId,
      'quantity' : quantity,
    };
    if(!checkOptionsSelected()){
      CommonUi.showNotificationToast(
          'Alert', 'Please select option values');
      return;
    }
    if(product!.options.isNotEmpty) {
      for (var item in product!.options) {
         map['option[${item.productOptionId}]'] = item.selectedValue!.productOptionValueId;
      }
    }

    var formData = FormData(map);
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

  bool checkOptionsSelected() {
   bool selected = true;
    for(var item in product!.options){
      if(item.selectedValue == null){
        selected = false;
        break;
      }
    }
    return selected;
  }

}
