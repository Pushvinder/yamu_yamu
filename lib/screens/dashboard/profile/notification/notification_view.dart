import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leadingWidth: 50,
        centerTitle: true,
        title: Text(
          Strings.textNotification,
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
        actions: [
          GestureDetector(
            onTap: (){

            },
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: ColorRes.colorPrimary,
                  size: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    Strings.textAddNew,
                    style: CommonUi.setCustomTextStyle(
                        textSize: 12.0,
                        textFont: Fonts.fontLailaBold,
                        textColor: ColorRes.colorPrimary),
                  ),
                ),
                const SizedBox(width: 20)
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: ColorRes.colorGrey2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  // Image.asset(
                  //   CommonUi.setPngImage('noti'),
                  //   height: 40,
                  //   width: 40,
                  // ),
                  Icon(Icons.notifications,size: 40,color: ColorRes.colorPrimary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(margin: const EdgeInsets.only(bottom: 5),child: const Icon(Icons.circle,color: ColorRes.colorPrimary,size: 10,)),
                            const SizedBox(width: 5),
                            Text(
                              'New Gift Offer',
                              style: CommonUi.setCustomTextStyle(
                                  textFont: Fonts.fontBold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'You have received a new gift from you...',
                          style: CommonUi.setCustomTextStyle(textColor: ColorRes.colorGrey,textSize: 14.0),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '12:30 pm     12/12/2021',
                          style: CommonUi.setCustomTextStyle(textColor: ColorRes.colorGrey,textSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
