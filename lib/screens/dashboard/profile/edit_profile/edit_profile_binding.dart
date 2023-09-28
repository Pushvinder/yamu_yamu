import 'package:get/get.dart';
import 'package:yamu/screens/dashboard/profile/edit_profile/edit_profile_controller.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}