import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonTextFeild.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Constants.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/constants/app_loader.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/auth/signup/signup_controller.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (SignUpController controller) {
      return Stack(
        children: [
          Scaffold(
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
                  percent: 0.3,
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
            body: SingleChildScrollView(
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
                      Strings.textStepOne,
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
                    Text('personal info',
                        style: CommonUi.setCustomTextStyle(
                            textSize: 24.0,
                            textFont: Fonts.fontLailaBold,
                            textColor: ColorRes.colorPrimary)),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: Strings.textAlreadyHaveAnAccount,
                        style: CommonUi.setCustomTextStyle(
                            textSize: 16.0,
                            textFont: Fonts.fontRegular,
                            textColor: ColorRes.colorLightBlue),
                        children: <TextSpan>[
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  if (Get.arguments == 'login') {
                                    Get.back();
                                  } else {
                                    Get.toNamed(Routes().login,
                                        arguments: 'signup');
                                  }
                                },
                              text: Strings.textLogIn,
                              style: CommonUi.setCustomTextStyle(
                                  textSize: 16.0,
                                  textFont: Fonts.fontRegular,
                                  textColor: ColorRes.colorPrimary)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    CommonTextField(
                      textController: controller.firstNameController,
                      style:
                          CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: Strings.textFirstName,
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      textController: controller.lastNameController,
                      style:
                          CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: Strings.textLastName,
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      textController: controller.emailController,
                      style:
                          CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: Strings.textEmail,
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      textController: controller.phoneNoController,
                      style:
                          CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: Strings.textMobileNumber,
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      textController: controller.shopNameController,
                      style:
                          CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: Strings.textShopName,
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      textController: controller.gstController,
                      style:
                          CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: Strings.textGstNumber,
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      textController: controller.passwordController,
                      style:
                          CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: Strings.textPassword,
                      hintText: '********',
                    ),
                    const SizedBox(height: 20),
                    CommonUi.setButton(
                        buttonText: Strings.textContinue,
                        onTap: () {
                          Constants.hideKeyboard();
                          controller.registerUser();
                        }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          if(controller.showLoader.value)...{
            const AppLoader()
          }
        ],
      );
    });
  }
}
