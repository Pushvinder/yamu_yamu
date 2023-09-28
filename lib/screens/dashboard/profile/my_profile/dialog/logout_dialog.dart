import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/constants/local_storage/LocalStorage.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/profile_controller.dart';

class LogoutDialog {
  Future exitApp({bool deleteUser = false}) {
    return Get.dialog(
      AlertDialog(
        title: Text(deleteUser ?Strings.textDoYouWantToDelete :Strings.textDoYouWantToExit,
            style: CommonUi.setCustomTextStyle(textFont: Fonts.fontBold)),
        content: Text(Strings.textWeHateToSeeYouLeave,
            style: CommonUi.setCustomTextStyle()),
        actions: <Widget>[
          Row(
            children: [
              Expanded(
                child: CommonUi.setButton(
                    buttonRadius: 50.0,
                    buttonText: Strings.textYes,
                    onTap: () {
                      if(deleteUser){
                        Get.find<ProfileController>().deleteUserAccount();
                      }else {
                        LocalStorage().clearDatabase();
                        Get.offAllNamed(Routes().onBoarding);
                      }}),
              ),
              Expanded(
                child: CommonUi.setButton(
                    buttonRadius: 50.0,
                    buttonText: Strings.textNo,
                    onTap: () {
                      Get.back();
                    }),
              ),
            ],
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
