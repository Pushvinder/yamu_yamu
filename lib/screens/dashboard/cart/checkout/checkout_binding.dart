import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/cart/checkout/checkout_controller.dart';

class CheckoutBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController());
  }
}