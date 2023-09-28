import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/profile/edit_profile/edit_profile_controller.dart';
import 'package:yamu/screens/dashboard/profile/my_address/my_address_controller.dart';

class MyAddressBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyAddressController());
  }
}