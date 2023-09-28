import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/home/product_detail/product_details_controller.dart';

class ProductDetailsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
  }
}