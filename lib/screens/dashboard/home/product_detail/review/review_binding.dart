import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/home/product_detail/review/review_controller.dart';

class ReviewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewController());
  }
}