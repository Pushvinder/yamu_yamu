import 'package:get/get.dart';
import 'cart_controller.dart';

class CartBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}