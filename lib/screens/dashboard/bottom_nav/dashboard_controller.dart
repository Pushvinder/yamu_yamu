import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/orders/orders_controller.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/profile_controller.dart';
import 'package:yamu/screens/dashboard/wishlist/wishlist_controller.dart';

class DashboardController extends GetxController {
  var bottomTabIndex = 0.obs;

  void onBottomTap(int index) {
    switch(index){
      case 1 : {
        Get.put(OrdersController());
        Get.find<OrdersController>().getOrders();
      }break;
      case 2 : {
        Get.put(WishlistController());
        Get.find<WishlistController>().getWishlistProductsList();
      }break;
     case 3 : {
        Get.put(ProfileController());
      }break;
    }
  }

}
