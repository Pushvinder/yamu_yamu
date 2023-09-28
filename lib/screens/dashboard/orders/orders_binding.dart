import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/orders/orders_controller.dart';

class OrdesBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersController());
  }
}