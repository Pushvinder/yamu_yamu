import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonTextFeild.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Constants.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/constants/app_loader.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/auth/forget_password/forget_pass_controller.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (ForgetPassController controller) {
      return Stack(
        children: [
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomScrollView(slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const SizedBox(height: 110),
                      Image.asset(
                        CommonUi.setPngImage('lock'),
                        height: 70,
                        width: 50,
                        fit: BoxFit.fill,
                        color: ColorRes.colorPrimary,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        Strings.textResetYourPassword,
                        style: CommonUi.setCustomTextStyle(
                            textSize: 24.0,
                            textFont: Fonts.fontLailaBold,
                            textColor: ColorRes.colorLightBlue),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        Strings.textPleaseEnterNumber,
                        style: CommonUi.setCustomTextStyle(
                            textSize: 14.0, textColor: ColorRes.colorLightBlue),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),
                      CommonTextField(
                        textController: controller.phoneNo,
                        style: CommonUi.setCustomTextStyle(
                            textFont: Fonts.fontSemiBold),
                        title: Strings.textPhoneNumber,
                        hintText: Strings.textPhoneNumber,
                      ),
                      const Spacer(),
                      const SizedBox(height: 20),
                      CommonUi.setButton(
                          buttonText: Strings.textSendMeCode,
                          onTap: () {
                            Constants.hideKeyboard();
                            controller.forgetPassword();
                          }),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ]),
            ),
          ),
          if (controller.showLoader.value) ...{const AppLoader()}
        ],
      );
    });
  }
}
