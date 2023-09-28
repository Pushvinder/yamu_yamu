import 'package:get/get.dart';
import 'package:yamu/screens/auth/forget_password/forget_pass_controller.dart';

class ForgetPassBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPassController());
  }
}