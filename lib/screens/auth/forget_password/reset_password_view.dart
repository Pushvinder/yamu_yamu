// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yamu/constants/ColorRes.dart';
// import 'package:yamu/constants/CommonTextFeild.dart';
// import 'package:yamu/constants/CommonUi.dart';
// import 'package:yamu/constants/Fonts.dart';
// import 'package:yamu/constants/Strings.dart';
//
// class ResetPasswordView extends StatelessWidget {
//   const ResetPasswordView({Key? key}) : super(key: key);
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
//                 Text(
//                   Strings.textPleaseAddNewPass,
//                   style: CommonUi.setCustomTextStyle(
//                       textSize: 14.0, textColor: ColorRes.colorLightBlue),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 50),
//                 CommonTextField(
//                   style:
//                       CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
//                   title: Strings.textNewPassword,
//                 ),
//                 const SizedBox(height: 20),
//                 CommonTextField(
//                   style:
//                       CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
//                   title: Strings.textRetypePassword,
//                 ),
//                 Spacer(),
//                 const SizedBox(height: 20),
//
//                 CommonUi.setButton(
//                     buttonText: Strings.textDone,
//                     onTap: () {
//                       Get.until((route) => route.isFirst);
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
