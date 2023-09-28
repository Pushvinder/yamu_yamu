import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';

class ProfileCompleteView extends StatelessWidget {
  const ProfileCompleteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(CommonUi.setPngImage('girl_illustration'),
                fit: BoxFit.fill,scale: 2.8,),
            const SizedBox(height: 10),
            Text(
              Strings.textReadyToGo,
              style: CommonUi.setCustomTextStyle(
                  textSize: 24.0, textFont: Fonts.fontLailaBold),
            ),
            const SizedBox(height: 10),
            Text(
              Strings.textThanksTakingPart,
              style: CommonUi.setCustomTextStyle(
                  textSize: 14.0,
                  textFont: Fonts.fontRegular,
                  textColor: ColorRes.colorLightBlue),textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            CommonUi.setButton(
                buttonText: Strings.textGetStarted,
                onTap: () {
                  Get.until((route) => route.isFirst);
                }),
          ],
        ),
      ),
    );
  }
}
