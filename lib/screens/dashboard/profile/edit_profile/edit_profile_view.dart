import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonTextFeild.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/constants/app_loader.dart';
import 'package:yamu/screens/dashboard/profile/edit_profile/edit_profile_controller.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/bottom_sheet/image_select_sheet.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (EditProfileController controller) {
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              leadingWidth: 50,
              centerTitle: true,
              title: Text(
                Strings.textEditProfile,
                style: CommonUi.setCustomTextStyle(
                    textSize: 20.0,
                    textFont: Fonts.fontLailaBold,
                    textColor: ColorRes.colorPrimary),
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
                    // GestureDetector(
                    //   onTap: (){
                        // ImageSelectSheet().showSheet(controller, 'text');
                      // },
                      // child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //     child:
                          // controller.profileImage.value.isNotEmpty
                          //     ? controller.profileImage.value.contains('http')
                          //         ? Image.network(
                          //             'https://images.unsplash.com/photo-1522069169874-c58ec4b76be5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=412&q=80',
                          //             height: 120,
                          //             width: 120,
                          //             fit: BoxFit.cover,
                          //           )
                          //         : Image.file(File(controller.profileImage.value),height: 120,width: 120,fit: BoxFit.cover,)
                          //     :
                          // Container(
                          //         padding: const EdgeInsets.symmetric(
                          //             horizontal: 10, vertical: 10),
                          //         height: 120,
                          //         width: 120,
                          //         decoration: const BoxDecoration(
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(20.0)),
                          //           color: ColorRes.colorPrimary,
                          //         ),
                          //         child:
                          //             Image.asset(CommonUi.setPngImage('yamu_logo')),
                          //       )
            // ),
            //         ),
                    const SizedBox(height: 20),
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
                    CommonUi.setButton(
                        buttonText: Strings.textSubmit, onTap: () {
                          controller.updateProfile();
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
