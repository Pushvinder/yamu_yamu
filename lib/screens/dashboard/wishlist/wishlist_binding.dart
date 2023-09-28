import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/wishlist/wishlist_controller.dart';

class WishlistBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController());
  }
}