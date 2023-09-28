import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonTextFeild.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/constants/app_loader.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/cart/my_cart/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (CartController controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 50,
          centerTitle: true,
          title: Text(
            Strings.textCart,
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
        body: controller.loader.value ? const AppLoader() : controller.cartList.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      CommonUi.setPngImage('empty_cart'),
                      scale: 2.5,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Strings.textYourCartEmpty,
                      style: CommonUi.setCustomTextStyle(
                          textFont: Fonts.fontLailaBold,
                          textColor: ColorRes.colorLightBlue,
                          textSize: 24.0),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      Strings.textFillCart,
                      style: CommonUi.setCustomTextStyle(
                        textColor: ColorRes.colorLightBlue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    CommonUi.setButton(
                        buttonText: Strings.textStartAdding, onTap: () {
                          Get.back();
                    }),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.cartList.value.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = controller.cartList.value[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                color: ColorRes.colorGrey2,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    CommonUi.setNetworkImage(item.thumb,
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
                                              Text(
                                                '',
                                                style:
                                                    CommonUi.setCustomTextStyle(
                                                        textFont:
                                                            Fonts.fontMedium,
                                                        textSize: 12.0,
                                                        textColor:
                                                            ColorRes.colorGrey),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          // Text(
                                          //   'Rs: ${item.price}',
                                          //   style: CommonUi.setCustomTextStyle(
                                          //       textFont: Fonts.fontMedium,
                                          //       textSize: 12.0),
                                          // ),
                                          Row(
                                            children: [
                                              Text(
                                                item.special.isEmpty ?  'Rs: ${item.price}' : 'Rs: ${item.special}',
                                                style: CommonUi.setCustomTextStyle(
                                                    textFont: Fonts.fontMedium,
                                                    textSize: 14.0),
                                              ),
                                              const SizedBox(width: 5),
                                              item.special.isEmpty ? const SizedBox() : Text(
                                                item.price,
                                                style: const TextStyle(
                                                    fontFamily:
                                                    Fonts.fontMedium,
                                                    fontSize: 14.0,
                                                    decoration: TextDecoration.lineThrough,
                                                    height: 1.0,
                                                    color:
                                                    ColorRes.colorGrey),
                                              ),

                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8.0)),
                                                    color: ColorRes.colorGrey2,
                                                    border: Border.all(
                                                        color: ColorRes
                                                            .colorLightGrey)),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .updateQuantity(
                                                                index,
                                                                increase:
                                                                    false);
                                                      },
                                                      child: Image.asset(
                                                          CommonUi.setPngImage(
                                                              'minus'),
                                                          height: 24,
                                                          width: 24),
                                                    ),
                                                    Text(
                                                      '   ${item.quantity}   ',
                                                      style: CommonUi
                                                          .setCustomTextStyle(
                                                              textFont: Fonts
                                                                  .fontMedium,
                                                              textSize: 12.0),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .updateQuantity(
                                                                index,
                                                                increase: true);
                                                      },
                                                      child: Image.asset(
                                                          CommonUi.setPngImage(
                                                              'add'),
                                                          height: 24,
                                                          width: 24),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .deleteFromCart(index);
                                                },
                                                child: const Icon(
                                                  Icons.delete_forever,
                                                  color: ColorRes.colorPrimary,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: CommonTextField(
                            textController: controller.couponController,
                            style: CommonUi.setCustomTextStyle(
                                textFont: Fonts.fontSemiBold),
                            title: Strings.textAddCoupon,
                            hintText: Strings.textEnterVoucherCode,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 55,
                          child: CommonUi.setButton(
                              buttonText: Strings.textApply,
                              onTap: () {
                                Get.toNamed(Routes().promo, arguments: 'cart')!
                                    .then((result) {
                                  if (result != null) {
                                    controller.couponController.text = result;
                                    controller.applyCoupon(result);
                                  }
                                });
                              }),
                        )),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: CommonTextField(
                            textController: controller.addressController,
                            style: CommonUi.setCustomTextStyle(
                                textFont: Fonts.fontSemiBold),
                            title: Strings.textAddAddress,
                            hintText: 'Select your address',
                          ),
                        ),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: 55,
                          child: CommonUi.setButton(
                              buttonText: Strings.textApply,
                              onTap: () {
                                Get.toNamed(Routes().myAddress,
                                        arguments: 'cart')!
                                    .then((result) {
                                  if (result != null) {
                                    controller.addressController.text =
                                        result['address'];
                                    var shipping = result['shipping'];
                                    controller.applyShipping(shipping);
                                  }
                                });
                              }),
                        )),
                        const SizedBox(width: 20),
                      ],
                    ),
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
                                        textColor: ColorRes.colorLightBlue)),
                              ),
                              Text(controller.cartList.length.toString(),
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
                                        textColor: ColorRes.colorLightBlue)),
                              ),
                              Text(
                                  'Rs: ${controller.cartDetails.value.subTotal}',
                                  style: CommonUi.setCustomTextStyle(
                                      textFont: Fonts.fontBold)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          if (controller
                                  .cartDetails.value.shipping!.isNotEmpty &&
                              controller.cartDetails.value.shipping !=
                                  'null') ...{
                            Row(
                              children: [
                                Expanded(
                                  child: Text('Shipping',
                                      style: CommonUi.setCustomTextStyle(
                                          textColor: ColorRes.colorLightBlue)),
                                ),
                                Text(
                                    'Rs: ${controller.cartDetails.value.shipping}',
                                    style: CommonUi.setCustomTextStyle(
                                        textFont: Fonts.fontBold)),
                              ],
                            ),
                            const SizedBox(height: 20),
                          },
                          if (controller
                                  .cartDetails.value.couponAmount!.isNotEmpty &&
                              controller.cartDetails.value.couponAmount !=
                                  'null') ...{
                            Row(
                              children: [
                                Expanded(
                                  child: Text('Coupon',
                                      style: CommonUi.setCustomTextStyle(
                                          textColor: ColorRes.colorLightBlue)),
                                ),
                                Text(
                                    'Rs: ${controller.cartDetails.value.couponAmount}',
                                    style: CommonUi.setCustomTextStyle(
                                        textFont: Fonts.fontBold)),
                              ],
                            ),
                            const SizedBox(height: 20),
                          },
                          if (controller.cartDetails.value.tax!.isNotEmpty &&
                              controller.cartDetails.value.tax != 'null') ...{
                            Row(
                              children: [
                                Expanded(
                                  child: Text('GST',
                                      style: CommonUi.setCustomTextStyle(
                                          textColor: ColorRes.colorLightBlue)),
                                ),
                                Text('Rs: ${controller.cartDetails.value.tax}',
                                    style: CommonUi.setCustomTextStyle(
                                        textFont: Fonts.fontBold)),
                              ],
                            ),
                            const SizedBox(height: 20),
                          },
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
                                        textColor: ColorRes.colorLightBlue)),
                              ),
                              Text('Rs: ${controller.cartDetails.value.total}',
                                  style: CommonUi.setCustomTextStyle(
                                      textFont: Fonts.fontBold)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CommonUi.setButton(
                              buttonText: Strings.textCheckOut,
                              onTap: () {
                                if (controller.addressController.text.isEmpty) {
                                  CommonUi.showNotificationToast('Error', "Please select your address");
                                  return;
                                }
                                Get.toNamed(Routes().checkout);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      );
    });
  }
}
