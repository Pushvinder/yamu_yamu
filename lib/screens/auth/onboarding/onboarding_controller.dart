import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  var pagePosition = 0.obs;
  var imageList =
      <String>['onboarding_one', 'onboarding_two', 'onboarding_three'].obs;

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    setTimeLoop();
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  void setTimeLoop() {
  _timer =  Timer(const Duration(seconds: 3), () {
      pagePosition.value++;
      if(pagePosition.value > imageList.length-1){
        pagePosition.value = 0;
      }
      pageController.animateToPage(pagePosition.value,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
      setTimeLoop();
    });
  }
}
