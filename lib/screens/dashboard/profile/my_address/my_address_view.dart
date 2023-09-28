import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/profile/my_address/my_address_controller.dart';

class MyAddressView extends StatelessWidget {
  const MyAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (MyAddressController controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 50,
          centerTitle: true,
          title: Text(
            Strings.textMyAddress,
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
              onTap: () {
                try {
                  controller.clearFields();
                } catch (e) {}
                Get.toNamed(Routes().addAddress)!.then((result) {
                  if (result == 'added') {
                    Timer(const Duration(seconds: 1), () {
                      controller.getAddressList();
                    });
                  }
                });
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
        body: controller.addressList.value.isEmpty
            ? Center(
                child: Text(
                  'No Data Found',
                  style: CommonUi.setCustomTextStyle(
                      textSize: 18.0, textFont: Fonts.fontBold),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: controller.addressList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.addressList[index];
                      return GestureDetector(
                        onTap: (){
                          if(controller.openFrom.value == 'cart'){
                            controller.getShippingByZone(item.zoneId,'${item.city} ${item.address1} ${item.postcode}');
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            color: ColorRes.colorGrey2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${item.firstname} ${item.lastname}',
                                      style: CommonUi.setCustomTextStyle(
                                          textFont: Fonts.fontBold),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          controller.deleteAddress(
                                              item.addressId, index);
                                        },
                                        child: const Icon(Icons.delete_forever,
                                            color: ColorRes.colorPrimary))
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  item.company,
                                  style: CommonUi.setCustomTextStyle(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '${item.city} ${item.address1} ${item.postcode}',
                                  style: CommonUi.setCustomTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
      );
    });
  }
}
