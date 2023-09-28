// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
// import 'package:yamu/constants/ColorRes.dart';
// import 'package:yamu/constants/CommonUi.dart';
// import 'package:yamu/constants/Fonts.dart';
// import 'package:yamu/constants/Strings.dart';
// import 'package:yamu/routes/Routes.dart';
//
// class OtpView extends StatelessWidget {
//   const OtpView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: CustomScrollView(slivers: [
//           SliverFillRemaining(
//             hasScrollBody: false,
//             child: Column(
//               children: [
//                 const SizedBox(height: 110),
//                 Image.asset(
//                   CommonUi.setPngImage('lock'),
//                   height: 70,
//                   width: 50,
//                   fit: BoxFit.fill,
//                   color: ColorRes.colorPrimary,
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   Strings.textResetYourPassword,
//                   style: CommonUi.setCustomTextStyle(
//                       textSize: 24.0,
//                       textFont: Fonts.fontLailaBold,
//                       textColor: ColorRes.colorLightBlue),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 50),
//                   child: Text(
//                     Strings.textPleaseEnterCode,
//                     style: CommonUi.setCustomTextStyle(
//                         textSize: 14.0, textColor: ColorRes.colorLightBlue),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 OtpTextField(
//                   numberOfFields: 4,
//                   borderColor: ColorRes.colorLightGrey,
//                   fillColor: ColorRes.colorGrey,
//                   showFieldAsBox: true,
//                   fieldWidth: 50,
//                   enabledBorderColor: ColorRes.colorLightGrey,
//                   disabledBorderColor: ColorRes.colorLightGrey,
//                   borderRadius: BorderRadius.circular(15.0),
//                   onCodeChanged: (String code) {},
//                   onSubmit: (String verificationCode) {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: Text(
//                               "Verification Code",
//                               style: CommonUi.setCustomTextStyle(
//                                   textSize: 14.0,
//                                   textColor: ColorRes.colorLightBlue),
//                             ),
//                             content: Text(
//                               'Code entered is $verificationCode',
//                               style: CommonUi.setCustomTextStyle(
//                                   textSize: 14.0,
//                                   textColor: ColorRes.colorLightBlue),
//                             ),
//                           );
//                         });
//                   }, // end onSubmit
//                 ),
//                 Spacer(),
//                 const SizedBox(height: 20),
//                 CommonUi.setButton(
//                     buttonText: Strings.textContinue,
//                     onTap: () {
//                       Get.toNamed(Routes().resetPassword);
//                     }),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }
