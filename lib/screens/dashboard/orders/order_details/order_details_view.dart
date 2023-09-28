import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Constants.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/constants/app_loader.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/orders/order_details/order_details_controller.dart';
import 'package:yamu/screens/dashboard/profile/my_profile/bottom_sheet/image_select_sheet.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (OrderDetailsController controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 50,
          centerTitle: true,
          title: Text(
            Strings.textOrders,
            style: CommonUi.setCustomTextStyle(
                textSize: 20.0,
                textFont: Fonts.fontLailaBold,
                textColor: ColorRes.colorPrimary),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_back,
                  color: ColorRes.colorLightBlue,
                )),
          ),
        ),
        body: controller.loader.value
            ? const AppLoader()
            : controller.orders.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        'No Data Found',
                        style: CommonUi.setCustomTextStyle(
                            textSize: 18.0, textFont: Fonts.fontBold),
                      ),
                    ))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 5, bottom: 10),
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    color: ColorRes.colorGrey2,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Order Id',
                                        style: CommonUi.setCustomTextStyle(
                                            textColor: ColorRes.colorLightBlue,
                                            textSize: 14.0,
                                            textFont: Fonts.fontLailaBold),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '#${controller.id.value}',
                                        style: CommonUi.setCustomTextStyle(
                                            textSize: 14.0,
                                            textFont: Fonts.fontLailaBold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 5, bottom: 10),
                                  height: 100,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    color: ColorRes.colorGrey2,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Point Earned',
                                        style: CommonUi.setCustomTextStyle(
                                            textColor: ColorRes.colorLightBlue,
                                            textSize: 14.0,
                                            textFont: Fonts.fontLailaBold),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '#${controller.pointEarned.value}',
                                        style: CommonUi.setCustomTextStyle(
                                            textSize: 14.0,
                                            textFont: Fonts.fontLailaBold),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Billing Address',
                            style: CommonUi.setCustomTextStyle(
                                textColor: ColorRes.colorLightBlue,
                                textSize: 16.0,
                                textFont: Fonts.fontLailaBold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            controller.billingAddress.value,
                            style: CommonUi.setCustomTextStyle(
                                textSize: 14.0, textFont: Fonts.fontMedium),
                          ),
                          const SizedBox(height: 10),
                          Container(
                              height: 2,
                              width: Get.width,
                              color: ColorRes.colorLightGrey),
                          const SizedBox(height: 10),
                          Text(
                            'Shipping Address',
                            style: CommonUi.setCustomTextStyle(
                                textColor: ColorRes.colorLightBlue,
                                textSize: 16.0,
                                textFont: Fonts.fontLailaBold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            controller.shippingAddress.value,
                            style: CommonUi.setCustomTextStyle(
                                textSize: 14.0, textFont: Fonts.fontMedium),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Order Details',
                            style: CommonUi.setCustomTextStyle(
                                textColor: ColorRes.colorLightBlue,
                                textSize: 16.0,
                                textFont: Fonts.fontLailaBold),
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.orders.length,
                              itemBuilder: (BuildContext context, int index) {
                                var item = controller.orders.value[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    color: ColorRes.colorGrey2,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      children: [
                                        CommonUi.setNetworkImage(item.image,
                                            imageWidth: 80,
                                            imageHeight: 80,
                                            radius: 20.0),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      item.name,
                                                      style: CommonUi
                                                          .setCustomTextStyle(
                                                              textFont: Fonts
                                                                  .fontLailaBold,
                                                              textSize: 14.0),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  5.0)),
                                                      color:
                                                          ColorRes.colorGrey2,
                                                      border: Border.all(
                                                        color:
                                                            ColorRes.colorGrey,
                                                        //                   <--- border color
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      '${item.quantity}x',
                                                      style: CommonUi
                                                          .setCustomTextStyle(
                                                              textFont: Fonts
                                                                  .fontMedium,
                                                              textSize: 12.0,
                                                              textColor: ColorRes
                                                                  .colorGrey),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Rs :${item.price}',
                                                      style: CommonUi
                                                          .setCustomTextStyle(),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                          Routes().review,
                                                          parameters: {
                                                            'id': item
                                                                .orderProductId,
                                                            'name': item.name,
                                                            'image': item.image,
                                                            'name2': ''
                                                          });
                                                    },
                                                    child: const Text(
                                                      'Review',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              Fonts.fontMedium,
                                                          fontSize: 14.0,
                                                          height: 1.0,
                                                          color: ColorRes
                                                              .colorPrimary),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)),
                              color: ColorRes.colorGrey2,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(Strings.textTotalItems,
                                          style: CommonUi.setCustomTextStyle(
                                              textColor:
                                                  ColorRes.colorLightBlue)),
                                    ),
                                    Text(controller.orders.length.toString(),
                                        style: CommonUi.setCustomTextStyle(
                                            textFont: Fonts.fontBold)),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(Strings.textPrice,
                                          style: CommonUi.setCustomTextStyle(
                                              textColor:
                                                  ColorRes.colorLightBlue)),
                                    ),
                                    Text(
                                        'Rs: ${controller.total.value.subTotal}',
                                        style: CommonUi.setCustomTextStyle(
                                            textFont: Fonts.fontBold)),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                if (controller.total.value.flatShippingRate!
                                        .isNotEmpty &&
                                    controller.total.value.flatShippingRate !=
                                        'null') ...{
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text('Shipping',
                                            style: CommonUi.setCustomTextStyle(
                                                textColor:
                                                    ColorRes.colorLightBlue)),
                                      ),
                                      Text(
                                          'Rs: ${controller.total.value.flatShippingRate}',
                                          style: CommonUi.setCustomTextStyle(
                                              textFont: Fonts.fontBold)),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                },
                                if (controller
                                        .total.value.coupon2222!.isNotEmpty &&
                                    controller.total.value.coupon2222 !=
                                        'null') ...{
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text('Coupon',
                                            style: CommonUi.setCustomTextStyle(
                                                textColor:
                                                    ColorRes.colorLightBlue)),
                                      ),
                                      Text(
                                          'Rs: ${controller.total.value.coupon2222}',
                                          style: CommonUi.setCustomTextStyle(
                                              textFont: Fonts.fontBold)),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                },
                                // if (controller.cartDetails.value.tax!.isNotEmpty &&
                                //     controller.cartDetails.value.tax != 'null') ...{
                                //   Row(
                                //     children: [
                                //       Expanded(
                                //         child: Text('GST',
                                //             style: CommonUi.setCustomTextStyle(
                                //                 textColor: ColorRes.colorLightBlue)),
                                //       ),
                                //       Text('Rs: ${controller.cartDetails.value.tax}',
                                //           style: CommonUi.setCustomTextStyle(
                                //               textFont: Fonts.fontBold)),
                                //     ],
                                //   ),
                                //   const SizedBox(height: 20),
                                // },
                                Container(
                                  height: 2,
                                  width: Get.width,
                                  color: ColorRes.colorLightGrey,
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(Strings.textTotalPrice,
                                          style: CommonUi.setCustomTextStyle(
                                              textColor:
                                                  ColorRes.colorLightBlue)),
                                    ),
                                    Text('Rs: ${controller.total.value.total}',
                                        style: CommonUi.setCustomTextStyle(
                                            textFont: Fonts.fontBold)),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                SizedBox(
                                  width: Get.width,
                                  child: Text(
                                    controller.slipImage.value.isNotEmpty
                                        ? 'Uploaded Receipt'
                                        : 'Upload bank slip for order confirmation',
                                    style: CommonUi.setCustomTextStyle(
                                        textFont: Fonts.fontLailaBold,
                                        textSize: 16.0,
                                        textColor: ColorRes.colorLightBlue),
                                    textAlign:
                                        controller.slipImage.value.isNotEmpty
                                            ? TextAlign.left
                                            : TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                controller.slipImage.value.isNotEmpty
                                    ? CommonUi.setNetworkImage(

                                            controller.slipImage.value,
                                        imageHeight: 150,
                                        fit: BoxFit.cover)
                                    : CommonUi.setButton(
                                        buttonText: 'Upload Slip',
                                        onTap: () {
                                          ImageSelectSheet()
                                              .showSheet(controller, '');
                                        }),
                                const SizedBox(height: 20),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
      );
    });
  }
}
