import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonTextFeild.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/constants/app_loader.dart';
import 'package:yamu/screens/dashboard/profile/my_address/my_address_controller.dart';

class AddAddressView extends StatelessWidget {
   AddAddressView({Key? key}) : super(key: key);
final MyAddressController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // return GetX(builder: (MyAddressController controller){
      return Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              leadingWidth: 50,
              centerTitle: true,
              title: Text(
                Strings.textAddAddress,
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
                      textController: controller.companyController,
                      style:
                      CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: 'Company',
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      textController: controller.addressOneController,
                      style:
                      CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: '${Strings.textNumberStreet} (Address 1)',
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      textController: controller.addressTwoController,
                      style:
                      CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: '${Strings.textNumberStreet} (Address 2)',
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      textController: controller.cityController,
                      style:
                      CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: Strings.textCity,
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      textController: controller.postcodeController,
                      style:
                      CommonUi.setCustomTextStyle(textFont: Fonts.fontSemiBold),
                      title: Strings.textPostCode,
                    ),
                    const SizedBox(height: 20),
                    CommonUi.setButton(
                        buttonText: Strings.textAddAddress, onTap: () {
                          controller.addAddress();
                    }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        Obx(()=> controller.loader.value ?const AppLoader() :const SizedBox())
        ],
      );
    // });
  }
}
