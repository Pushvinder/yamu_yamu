import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/screens/dashboard/orders/order_details/order_details_controller.dart';

class SlipView extends StatelessWidget {
  String imagePath;
  SlipView(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leadingWidth: 50,
        centerTitle: true,
        title: Text(
          'Upload Slip',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(child: Center(child: Image.file(File(imagePath)))),
            const SizedBox(height: 20),
            CommonUi.setButton(
                buttonText: 'Upload',
                onTap: () {
                  Get.find<OrderDetailsController>().uploadSlip(imagePath);
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
