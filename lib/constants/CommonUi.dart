import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/Constants.dart';
import 'Fonts.dart';

class CommonUi {
  String setJpgImage(String name) {
    return "assets/images/$name.jpg";
  }

  static String setPngImage(String name) {
    return "assets/images/$name.png";
  }

  static String setSvgImage(String name) {
    return "assets/svgs/$name.svg";
  }

  static String setJpegImage(String name) {
    return "assets/images/$name.jpeg";
  }

  static showNotificationToast(String title, String msg, {int second = 5}) {
    Get.snackbar(title, msg,
        snackPosition: SnackPosition.BOTTOM,
        colorText: ColorRes.colorBlack,
        backgroundColor: ColorRes.colorWhite,
        duration: Duration(seconds: second));
  }

  static setCustomTextStyle(
      {textSize = 16.0,
      textColor = ColorRes.colorDarkBlue,
      textFont = Fonts.fontRegular,
      textDecoration = TextDecoration.none}) {
    return TextStyle(
        fontSize: textSize,
        color: textColor,
        height: 1.0,
        fontFamily: textFont,
        decoration: textDecoration);
  }

  static setButton(
      {double buttonRadius = 10.0,
      String buttonText = "",
      Color buttonTextColor = ColorRes.colorWhite,
      double buttonTextSize = 14.0,
      String buttonFontFamily = Fonts.fontSemiBold,
      Color buttonColor = ColorRes.colorPrimary,
      VoidCallback? onTap}) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
      ),
      child: Container(
        alignment: Alignment.center,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(buttonRadius)),
          color: buttonColor,
        ),
        // minWidth: double.infinity,
        child: Text(
          buttonText,
          style: CommonUi.setCustomTextStyle(
              textColor: buttonTextColor,
              textFont: buttonFontFamily,
              textSize: buttonTextSize),
        ),
      ),
    );
  }

  static searchField(
      bool fieldEnable, String hintText, TextEditingController textController,
      {required Null Function(String value) onValueChanged}) {
    return TextFormField(
      controller: textController,
      onChanged: onValueChanged,
      style: CommonUi.setCustomTextStyle(
          textFont: Fonts.fontSemiBold, textColor: ColorRes.colorWhite),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(width: 1, color: Colors.white30),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(width: 1, color: Colors.white30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(width: 1, color: Colors.white30),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(width: 1, color: Colors.white30),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(width: 1, color: Colors.white30),
          ),
          fillColor: Colors.white30,
          focusColor: Colors.white30,
          isDense: true,
          suffixIcon: const Icon(
            Icons.search,
            color: ColorRes.colorWhite,
          ),
          hintText: hintText,
          hintStyle: CommonUi.setCustomTextStyle(
              textColor: ColorRes.colorWhite,
              textSize: 14.0,
              textFont: Fonts.fontBold),
          enabled: fieldEnable,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          filled: true),
    );
  }

  static Widget setNetworkImage(String image,
      {double radius = 10.0,
      double imageHeight = 100.0,
      double imageWidth = 100.0,
      BoxFit fit = BoxFit.fill}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: FadeInImage.assetNetwork(
        height: imageHeight,
        width: imageWidth,
        placeholder: CommonUi.setPngImage('yamu_logo'),
        placeholderCacheHeight: imageHeight.toInt(),
        placeholderCacheWidth: imageWidth.toInt(),
        imageErrorBuilder: (context, error, i) => Image.asset(
          CommonUi.setPngImage('yamu_logo'),
          height: imageHeight,
          width: imageWidth,
          color: ColorRes.colorPrimary,
        ),
        image: Constants.imageBaseUrl + image,
        fit: fit,
      ),
    );
  }
}
