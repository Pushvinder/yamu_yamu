import 'package:get/get.dart';
import 'package:yamu/screens/auth/signup/signup_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => SignUpController());
  }
}