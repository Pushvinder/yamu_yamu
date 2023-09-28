import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/orders/order_details/order_details_controller.dart';
import 'package:yamu/screens/dashboard/orders/order_details/order_details_view.dart';

class OrderDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>  OrderDetailsController());
  }
}