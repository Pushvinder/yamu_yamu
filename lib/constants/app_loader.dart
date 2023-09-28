import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
    color: Colors.transparent,
      child: const SpinKitRipple(
        color: ColorRes.colorPrimary,
        size: 80.0,
      ),
    );
  }
}
