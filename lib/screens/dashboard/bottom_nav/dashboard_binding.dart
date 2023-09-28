import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/bottom_nav/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
