import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/screens/dashboard/orders/order_details/order_details_controller.dart';

class ImageSelectSheet {
  void showSheet(OrderDetailsController controller, String text) {
    Get.bottomSheet(
      Wrap(
        children: [
          Container(
              width: Get.width,
              padding: const EdgeInsets.only(top: 10.0),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 5.0, top: 10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
              ),

              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                      controller.selectImageFromGallery(text);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 10.0, top: 5.0),
                      height: 30.0,
                      width: Get.width,
                      color: Colors.white,
                      child: Text(Strings.textGalleryImage,
                          style: CommonUi.setCustomTextStyle()),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                      controller.selectImageFromCamera(text);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      height: 30.0,
                      width: Get.width,
                      color: Colors.white,
                      child: Text(Strings.textCameraImage,
                          style: CommonUi.setCustomTextStyle()),
                    ),
                  ),
                ],
              )),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
                height: 45,
                width: Get.width,
                margin: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(Strings.textCancel,
                      style: CommonUi.setCustomTextStyle()),
                )),
          ),
        ],
      ),
      enableDrag: true,
      isDismissible: true,
    );
  }
}
