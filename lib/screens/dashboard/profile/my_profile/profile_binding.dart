import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/profile_controller.dart';

class ProfileBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}