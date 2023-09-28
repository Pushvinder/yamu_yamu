import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/routes/Routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var localStorage = LocalStorage();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (localStorage.getAProfile().isEmpty) {
        Get.offNamed(Routes().onBoarding);
      } else {
        Get.offAllNamed(Routes().dashboard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.colorPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Image.asset(CommonUi.setPngImage('app-icon'),
            //     height: 200, width: 200, fit: BoxFit.fill),

            Image.asset(CommonUi.setPngImage('yamu_logo'),
                height: 100, width: 70, fit: BoxFit.fill),
            const SizedBox(height: 10),
            Text(
              Strings.textAppTitle,
              style: CommonUi.setCustomTextStyle(
                  textSize: 45.0,
                  textFont: Fonts.fontLailaMedium,
                  textColor: ColorRes.colorWhite),
            ),
            const SizedBox(height: 10),
            Text(
              Strings.textInventBeauty,
              style: CommonUi.setCustomTextStyle(
                  textSize: 18.0,
                  textFont: Fonts.fontMedium,
                  textColor: ColorRes.colorWhite),
            )
          ],
        ),
      ),
    );
  }
}
