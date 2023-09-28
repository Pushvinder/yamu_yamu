import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/cart/track_order/track_order_controller.dart';

class TrackOrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TrackOrderController());
  }
}