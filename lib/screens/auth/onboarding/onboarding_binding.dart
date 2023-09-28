import 'package:get/get.dart';
import 'package:yamu/screens/auth/onboarding/onboarding_controller.dart';

class onBoardingBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => OnBoardingController());
  }
}