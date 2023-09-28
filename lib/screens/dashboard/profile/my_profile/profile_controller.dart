import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yamu/api_provider/ApiProvider.dart';
import 'package:yamu/api_provider/ApiRoutes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/dialog/logout_dialog.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/webview_links.dart';

class ProfileController extends GetxController {
  var localStorage = LocalStorage();
  final apiProvider = ApiProvider();

  var profileOptions = [
    {'profile', 'My Profile'},
    {'address', 'My Address'},
    // {'noti', 'Notifications'},
    {'promo', 'Promo'},
    {'about', 'About Us'},
    {'about', 'Terms & Conditions'},
    {'about', 'Privacy Policy'},
    {'logout', 'Log out'},
    {'delete', 'Delete Account'},
  ].obs;

  // var profileImage = ''.obs;
  var userName = ''.obs;
  var userId = ''.obs;
  var webLoader = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUserData();
    GetStorage().listenKey('profile', (value) {
      getUserData();
    });
  }

  void getUserData() {
    var profileData = jsonDecode(localStorage.getAProfile());
    userName.value = profileData['firstname'];
    userId.value = profileData['customer_id'];
  }

  void onProfileOptionsTap(int index) {
    switch (index) {
      case 0:
        {
          Get.toNamed(Routes().editProfile);
        }
        break;
      case 1:
        {
          Get.toNamed(Routes().myAddress);
        }
        break;
      case 2:
        {
          Get.toNamed(Routes().promo);
        }
        break;
      case 3:
        {
          Get.to(WebViewLinks(
              'https://yamuindia.com/index.php?route=information/information&language=en-gb&information_id=1',
              'About Us'));
        }
        break;
      case 4:
        {
          Get.to(WebViewLinks(
              'https://yamuindia.com/index.php?route=information/information&language=en-gb&information_id=2',
              'Terms & Conditions'));
        }
        break;
      case 5:
        {
          Get.to(WebViewLinks(
              'https://yamuindia.com/index.php?route=information/information&language=en-gb&information_id=3',
              'Privacy Policy'));
        }
        break;
      case 6:
        {
          LogoutDialog().exitApp();
        }
        break;
      case 7:
        {
          LogoutDialog().exitApp(deleteUser: true);
        }
        break;
    }
  }

  void deleteUserAccount() {
    var customerId = jsonDecode(localStorage.getAProfile())['customer_id'];
    var endPoint = '${ApiRoutes.deleteUser}$customerId&api_key=222222';
    apiProvider.getApi(endPoint).then((value) {
      if (value == 'error') {
        CommonUi.showNotificationToast(
            'Error', 'Something went wrong please try again');
      } else {
        var result = jsonDecode(value);
        if (result['message'][0]['msg_status']) {
          LocalStorage().clearDatabase();
          Get.offAllNamed(Routes().onBoarding);
          CommonUi.showNotificationToast(
              'Success', result['message'][0]['msg']);
        } else {
          CommonUi.showNotificationToast('Error', result['message'][0]['msg']);
        }
      }
    }).catchError((error) {
      CommonUi.showNotificationToast('Error', error.toString());
    });
  }
}
