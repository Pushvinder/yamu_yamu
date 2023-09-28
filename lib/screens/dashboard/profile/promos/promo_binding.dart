import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/profile/promos/promo_controller.dart';

class PromoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PromoController());
  }
}