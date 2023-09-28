import 'dart:convert';

import 'package:get/get.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/home/model/categories_model.dart';
import 'package:yamu/screens/dashboard/home/model/home_banner.dart';
import 'package:yamu/screens/dashboard/home/model/products_model.dart';
import 'package:yamu/screens/dashboard/wishlist/wishlist_controller.dart';

class HomeController extends GetxController {
  var localStorage = LocalStorage();
  final apiProvider = ApiProvider();

  RxList<Banner> bannerList = <Banner>[].obs;
  RxList<Banner> bottomBannerList = <Banner>[].obs;
  RxList<Category> categoryList = <Category>[].obs;
  RxList<Product> specialProductList = <Product>[].obs;
  RxList<Product> latestProductList = <Product>[].obs;
  RxList<Product> jewelleryProductList = <Product>[].obs;
  RxList<Product> beautyProductList = <Product>[].obs;
  RxList<Product> categoryProductsList = <Product>[].obs;

  var bannerCurrentIndex = 0.obs;
  var bottomBannerCurrentIndex = 0.obs;

  var userName = ''.obs;
  @override
  void onInit() {
    super.onInit();
    try {
      userName.value = jsonDecode(localStorage.getAProfile())['firstname'];
    }catch(e){}
    getHomeBanner();
    getHomeBottomBanner();
    getCategoriesList();
    getSpecialProductsList();
    getLatestProductsList();
    getJewelleryProductsList();
    getBeautyProductsList();
  }

  void getHomeBanner() {
    apiProvider.getApi(ApiRoutes.homeBanner).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          bannerList.value = List<Banner>.from(
              result['banner'].map((x) => Banner.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void getCategoriesList() {
    apiProvider.getApi(ApiRoutes.homeCategory).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          categoryList.value = List<Category>.from(
              result['categories'].map((x) => Category.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void getJewelleryProductsList() {
    apiProvider.getApi(ApiRoutes.getJewelleryProducts).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          jewelleryProductList.value = List<Product>.from(
              result['products'].map((x) => Product.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void getBeautyProductsList() {
    apiProvider.getApi(ApiRoutes.getBeautyProduct).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          beautyProductList.value = List<Product>.from(
              result['products'].map((x) => Product.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }


  void getSpecialProductsList() {
    apiProvider.getApi(ApiRoutes.specialProduct).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          specialProductList.value = List<Product>.from(
              result['special_products'].map((x) => Product.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void getLatestProductsList() {
    apiProvider.getApi(ApiRoutes.latestProduct).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          latestProductList.value = List<Product>.from(
              result['latest_products'].map((x) => Product.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void addProductToCart(String productId,{quantity = '1'}) {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint =
        '${ApiRoutes.addToCart}$customerId&api_key=222222';
    var formData = FormData({
      'product_id':productId,
      'quantity' : quantity
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

  void addProductToWishlist(String productId) {
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
          CommonUi.showNotificationToast('Success', result['message'][0]['msg']);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void getCategoryProducts(String categoryId) {
    apiProvider.getApi('${ApiRoutes.categoryProducts}$categoryId&api_key=222222').then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          categoryProductsList.value = List<Product>.from(
              result['products'].map((x) => Product.fromJson(x)));
          Get.toNamed(Routes().categoryProducts);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }

  void getHomeBottomBanner() {
    apiProvider.getApi(ApiRoutes.homeBottomBanner).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          bottomBannerList.value = List<Banner>.from(
              result['banner'].map((x) => Banner.fromJson(x)));
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }
}
