import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/auth/onboarding/onboarding_controller.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (OnBoardingController controller) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    width: Get.width,
                    child: PageView.builder(
                        controller: controller.pageController,
                        itemCount: controller.imageList.length,
                        onPageChanged: (value) {
                          controller.pagePosition.value = value;
                        },
                        itemBuilder: (context, index) {
                          var item = controller.imageList[index];
                          return Image.asset(
                            CommonUi.setPngImage(item),
                            fit: BoxFit.fill,
                          );
                        }),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: DotsIndicator(
                      dotsCount: controller.imageList.length,
                      position: controller.pagePosition.value,
                      decorator: const DotsDecorator(
                        color: ColorRes.colorWhite, // Inactive color
                        activeColor: ColorRes.colorPrimary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.textWelcomeTo,
                    style: CommonUi.setCustomTextStyle(
                        textSize: 24.0,
                        textFont: Fonts.fontMedium,
                        textColor: ColorRes.colorLightBlue),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    Strings.textTheWorldOf,
                    style: const TextStyle(
                      fontSize: 42.0,
                      color: ColorRes.colorLightBlue,
                      height: 1.0,
                      fontFamily: Fonts.fontLailaMedium,
                    ),
                  ),
                  Text(
                    Strings.textAppTitle,
                    style: const TextStyle(
                      fontSize: 42.0,
                      color: ColorRes.colorPrimary,
                      height: 1.0,
                      fontFamily: Fonts.fontLailaMedium,
                    ),
                  ),
                  const SizedBox(height: 35),
                  CommonUi.setButton(
                      buttonText: Strings.textContinueWithEmail,
                      onTap: () {
                        Get.toNamed(Routes().login ,arguments: '');
                      }),
                  CommonUi.setButton(
                      buttonText: Strings.textCreateAnAccount,
                      buttonColor: ColorRes.colorSecondary,
                      buttonTextColor: ColorRes.colorPrimary,
                      onTap: () {
                        Get.toNamed(Routes().signup,arguments: '');
                      }),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
