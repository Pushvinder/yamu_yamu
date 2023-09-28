import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonTextFeild.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Constants.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/auth/login/login_controller.dart';

import '../../../constants/app_loader.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (LoginController controller){
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              leadingWidth: 50,
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset(CommonUi.setPngImage('back_arrow'))),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          Image.asset(
                            CommonUi.setPngImage('yamu_logo'),
                            height: 70,
                            width: 50,
                            fit: BoxFit.fill,
                            color: ColorRes.colorPrimary,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            Strings.textLogIn,
                            style: CommonUi.setCustomTextStyle(
                                textSize: 24.0,
                                textFont: Fonts.fontLailaBold,
                                textColor: ColorRes.colorLightBlue),
                          ),
                          const SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              text: Strings.textDontHaveAccount,
                              style: CommonUi.setCustomTextStyle(
                                  textSize: 16.0,
                                  textFont: Fonts.fontRegular,
                                  textColor: ColorRes.colorLightBlue),
                              children: <TextSpan>[
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        if (Get.arguments == 'signup') {
                                          Get.back();
                                        }else{
                                          Get.toNamed(
                                              Routes().signup, arguments: 'login');
                                        }
                                      },
                                    text: Strings.textSignUp,
                                    style: CommonUi.setCustomTextStyle(
                                        textSize: 16.0,
                                        textFont: Fonts.fontRegular,
                                        textColor: ColorRes.colorPrimary)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          CommonTextField(
                            textController: controller.emailController,
                            style: CommonUi.setCustomTextStyle(
                                textFont: Fonts.fontSemiBold),
                            title: Strings.textEmail,
                            hintText: Strings.textTypeYourEmail,
                          ),
                          const SizedBox(height: 20),
                          CommonTextField(
                            textController: controller.passwordController,
                            style: CommonUi.setCustomTextStyle(
                                textFont: Fonts.fontSemiBold),
                            title: Strings.textPassword,
                            hintText: Strings.textTypeYourPassword,
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes().forgetPassword);
                              },
                              child: Text(
                                Strings.textForgetPassword,
                                style: CommonUi.setCustomTextStyle(
                                    textSize: 14.0,
                                    textFont: Fonts.fontSemiBold,
                                    textColor: ColorRes.colorDarkGrey),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Spacer(),
                          CommonUi.setButton(buttonText: Strings.textGetStarted,onTap: (){
                            Constants.hideKeyboard();
                            controller.loginUser();
                          }),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )
                  ]
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
