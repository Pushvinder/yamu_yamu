import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/home/my_home/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController(),permanent: true);
  }
}