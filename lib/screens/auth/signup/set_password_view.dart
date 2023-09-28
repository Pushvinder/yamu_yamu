import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonTextFeild.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';

class SetPasswordView extends StatelessWidget {
  const SetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leadingWidth: 50,
        centerTitle: true,
        title: SizedBox(
          width: 150,
          child: LinearPercentIndicator(
            width: 150,
            barRadius: const Radius.circular(20.0),
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: 0.8,
            backgroundColor: ColorRes.colorSecondary,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: ColorRes.colorPrimary,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(CommonUi.setPngImage('back_arrow'))),
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  width: Get.width,
                ),
                Text(
                  Strings.textStepThree,
                  style: CommonUi.setCustomTextStyle(
                      textSize: 20.0,
                      textFont: Fonts.fontSemiBold,
                      textColor: ColorRes.colorDarkGrey),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Please set',
                    style: CommonUi.setCustomTextStyle(
                        textSize: 28.0,
                        textFont: Fonts.fontLailaBold,
                        textColor: ColorRes.colorLightBlue),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' your',
                          style: CommonUi.setCustomTextStyle(
                              textSize: 28.0,
                              textFont: Fonts.fontLailaBold,
                              textColor: ColorRes.colorPrimary)),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text('password',
                    style: CommonUi.setCustomTextStyle(
                        textSize: 24.0,
                        textFont: Fonts.fontLailaBold,
                        textColor: ColorRes.colorPrimary)),
                const SizedBox(height: 20),
                Text(Strings.textChooseStrongPassword,
                    style: CommonUi.setCustomTextStyle(
                        textSize: 14.0, textColor: ColorRes.colorDarkGrey)),
                const SizedBox(height: 40),
                CommonTextField(
                  style:
                  CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                  title: '',
                  hintText: '********',
                ),
                const SizedBox(height: 20),
                const Spacer(),
                CommonUi.setButton(
                    buttonText: Strings.textContinue,
                    onTap: () {
                      Get.offAllNamed(Routes().profileComplete);
                    }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
