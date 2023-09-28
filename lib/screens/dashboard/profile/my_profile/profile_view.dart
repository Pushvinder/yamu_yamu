import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (ProfileController controller) {
      return Stack(
        children: [
          Image.asset(
            CommonUi.setPngImage('profile_bg'),
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              centerTitle: true,
              // leading: const Icon(Icons.arrow_back),
              title: Text(
                Strings.textProfile,
                style: CommonUi.setCustomTextStyle(
                    textFont: Fonts.fontLailaBold,
                    textSize: 20.0,
                    textColor: ColorRes.colorWhite),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(12.0),
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: ColorRes.colorWhite,
                boxShadow: [
                  BoxShadow(
                    color: ColorRes.colorSecondary,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            CommonUi.setPngImage('yamu_logo'),
                            width: 80,
                            height: 80,color: ColorRes.colorPrimary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, ${controller.userName.value}',
                                style: CommonUi.setCustomTextStyle(
                                    textFont: Fonts.fontBold,
                                    textColor: ColorRes.colorLightBlue),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'ID: #${controller.userId.value}',
                                style: CommonUi.setCustomTextStyle(
                                    textColor: ColorRes.colorLightBlue),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      color: ColorRes.colorLightOrange,
                      width: Get.width,
                      height: 2,
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.profileOptions.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = controller.profileOptions[index];
                          return GestureDetector(
                            onTap: () {
                              controller.onProfileOptionsTap(index);
                            },
                            child: Column(
                              children: [
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    item.first == 'about'
                                        ? const Icon(
                                            Icons.article_outlined,
                                            size: 30,
                                            color: ColorRes.colorPrimary,
                                          )
                                        : item.first == 'delete'
                                            ? const Icon(
                                                Icons.delete_forever_outlined,
                                                size: 30,
                                                color: ColorRes.colorPrimary,
                                              )
                                            : item.first == 'address'
                                                ? const Icon(
                                                    Icons
                                                        .add_location_alt_sharp,
                                                    size: 30,
                                                    color:
                                                        ColorRes.colorPrimary,
                                                  )
                                                : Image.asset(
                                                    CommonUi.setPngImage(
                                                        item.first),
                                                    height: 25,
                                                    width: 25,
                                                    color:
                                                        ColorRes.colorPrimary,
                                                  ),
                                    const SizedBox(width: 15),
                                    Text(
                                      item.last,
                                      style: CommonUi.setCustomTextStyle(
                                          textFont: Fonts.fontMedium),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: ColorRes.colorPrimary,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
