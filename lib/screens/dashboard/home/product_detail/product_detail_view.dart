import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Constants.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/constants/app_loader.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/home/my_home/home_controller.dart';
import 'package:yamu/screens/dashboard/home/product_detail/model/product_details_model.dart';
import 'package:yamu/screens/dashboard/home/product_detail/product_details_controller.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (ProductDetailsController controller) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorRes.colorWhite,
          body: controller.loader.value
              ? const AppLoader()
              : controller.product == null
                  ? Center(
                      child: Text(
                        'No Data Found',
                        style: CommonUi.setCustomTextStyle(
                            textSize: 18.0, textFont: Fonts.fontBold),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    width: Get.width,
                                    height: Get.height / 2,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(70.0),
                                          bottomLeft: Radius.circular(70.0)),
                                      child: Image.network(
                                        Constants.imageBaseUrl +
                                            controller.image.value,
                                        fit: BoxFit.cover,
                                        width: Get.width,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 50)
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                left: 70,
                                right: 70,
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      color: ColorRes.colorWhite,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          controller.product?.name ?? '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CommonUi.setCustomTextStyle(
                                              textSize: 24.0,
                                              textFont: Fonts.fontBold),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                controller.product
                                                        ?.additionalName ??
                                                    '',
                                                style:
                                                    CommonUi.setCustomTextStyle(
                                                        textFont:
                                                            Fonts.fontMedium,
                                                        textColor: ColorRes
                                                            .colorDarkGrey),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  controller.product!.special
                                                          .isEmpty
                                                      ? 'Rs: ${controller.product?.price}'
                                                      : 'Rs: ${controller.product?.special}',
                                                  style: CommonUi
                                                      .setCustomTextStyle(
                                                          textFont:
                                                              Fonts.fontMedium,
                                                          textSize: 14.0),
                                                ),
                                                const SizedBox(width: 5),
                                                controller.product!.special
                                                        .isEmpty
                                                    ? const SizedBox()
                                                    : Text(
                                                        controller
                                                            .product!.price,
                                                        style: const TextStyle(
                                                            fontFamily: Fonts
                                                                .fontMedium,
                                                            fontSize: 14.0,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            height: 1.0,
                                                            color: ColorRes
                                                                .colorGrey),
                                                      ),
                                              ],
                                            ),
                                            //
                                            // Text(
                                            //   'Rs: ${controller.product?.price}',
                                            //   style: CommonUi.setCustomTextStyle(
                                            //       textFont: Fonts.fontMedium,
                                            //       textColor:
                                            //           ColorRes.colorDarkGrey),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 45,
                                right: 30,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes().review,
                                            parameters: {
                                              'id':
                                                  controller.product!.productId,
                                              'name': controller.product!.name,
                                              'image':
                                                  controller.product!.thumb,
                                              'name2': controller
                                                  .product!.additionalName
                                            });
                                      },
                                      child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(50.0)),
                                            color: Colors.black26,
                                          ),
                                          padding: const EdgeInsets.all(5.0),
                                          child: const Icon(
                                              Icons.rate_review_outlined,
                                              color: Colors.white)),
                                    ),
                                    const SizedBox(height: 15),
                                    GestureDetector(
                                      onTap: () {
                                        Share.share(
                                            'check out this prouct ${controller.product!.href}');
                                      },
                                      child:Container(
                                          decoration: const BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(50.0)),
                                            color: Colors.black26,
                                          ),
                                          padding: const EdgeInsets.all(5.0),
                                          child: const Icon(
                                              Icons.share,
                                              color: Colors.white)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          controller.product!.otherImages.isEmpty
                              ? const SizedBox()
                              : SizedBox(
                                  width: Get.width,
                                  height: 110,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: controller
                                          .product?.otherImages.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var item = controller
                                            .product?.otherImages[index];
                                        return item!.image.isEmpty
                                            ? const SizedBox()
                                            : GestureDetector(
                                                onTap: () {
                                                  controller.image.value =
                                                      item.image;
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 15,
                                                      left:
                                                          index == 0 ? 15 : 0),
                                                  child: Column(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        child: Image.network(
                                                          Constants
                                                                  .imageBaseUrl +
                                                              item.image,
                                                          fit: BoxFit.cover,
                                                          width: 80,
                                                          height: 80,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      controller.image.value ==
                                                              item.image
                                                          ? const Icon(
                                                              Icons.circle,
                                                              color: ColorRes
                                                                  .colorPrimary,
                                                              size: 10,
                                                            )
                                                          : const SizedBox()
                                                    ],
                                                  ),
                                                ),
                                              );
                                      }),
                                ),
                          for (int i = 0;
                              i < controller.product!.options.length;
                              i++) ...{
                            GetBuilder(
                                builder: (ProductDetailsController controller) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    child: Text(
                                      'Product ${controller.product!.options[i].name}',
                                      style: CommonUi.setCustomTextStyle(
                                          textFont: Fonts.fontBold,
                                          textColor: ColorRes.colorPrimary),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 9.0),
                                    decoration: BoxDecoration(
                                      color: ColorRes.colorLightGrey,
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                          color: ColorRes.colorGrey,
                                          style: BorderStyle.solid,
                                          width: 0.80),
                                    ),
                                    child: DropdownButton(
                                      isDense: true,
                                      elevation: 0,
                                      hint: Text(
                                        'Select ${controller.product!.options[i].name}',
                                        style: CommonUi.setCustomTextStyle(
                                            textFont: Fonts.fontBold),
                                      ),
                                      items: controller.product!.options[i]
                                          .productOptionValue
                                          .map((value) => DropdownMenuItem(
                                                value: value,
                                                child: Text(value.name),
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        var data = value as ProductOptionValue;
                                        controller.product!.options[i]
                                            .selectedValue = data;
                                        controller.update();
                                      },
                                      isExpanded: true,
                                      underline: Container(),
                                      value: controller
                                          .product!.options[i].selectedValue,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          },
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.tab.value = 0;
                                      },
                                      child: Column(
                                        children: [
                                          Text(
                                            Strings.textFeatures,
                                            style: CommonUi.setCustomTextStyle(
                                                textFont: Fonts.fontBold,
                                                textColor:
                                                    ColorRes.colorPrimary),
                                          ),
                                          controller.tab.value == 0
                                              ? Container(
                                                  height: 2,
                                                  width: Get.width / 5,
                                                  color: ColorRes.colorPrimary,
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                )
                                              : const SizedBox(
                                                  height: 12,
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.tab.value = 1;
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                Strings.textReviews,
                                                style:
                                                    CommonUi.setCustomTextStyle(
                                                        textFont:
                                                            Fonts.fontBold,
                                                        textColor: ColorRes
                                                            .colorPrimary),
                                              ),
                                              const Icon(
                                                Icons.star,
                                                color: ColorRes.colorPrimary,
                                                size: 18,
                                              )
                                            ],
                                          ),
                                          controller.tab.value != 0
                                              ? Container(
                                                  height: 2,
                                                  width: Get.width / 5,
                                                  color: ColorRes.colorPrimary,
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 5),
                                                )
                                              : const SizedBox(height: 12)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              controller.tab.value == 1
                                  ? controller.reviewList.value.isEmpty
                                      ? SizedBox(
                                          height: 100,
                                          width: Get.width,
                                          child: Center(
                                            child: Text(
                                              'No Reviews Found',
                                              style:
                                                  CommonUi.setCustomTextStyle(
                                                      textSize: 14.0),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: controller
                                              .reviewList.value.length,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 8.0),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            var item = controller
                                                .reviewList.value[index];
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Image.network(
                                                        Constants.imageBaseUrl +
                                                            controller
                                                                .image.value,
                                                        fit: BoxFit.cover,
                                                        width: 40,
                                                        height: 40,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      item.author,
                                                      style: CommonUi
                                                          .setCustomTextStyle(
                                                              textColor: ColorRes
                                                                  .colorGrey),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      item.rating,
                                                      style: CommonUi
                                                          .setCustomTextStyle(
                                                              textFont: Fonts
                                                                  .fontBold),
                                                    ),
                                                    const Icon(
                                                      Icons.star,
                                                      color:
                                                          ColorRes.colorPrimary,
                                                      size: 18,
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  width: Get.width,
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                    color: ColorRes.colorGrey2,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    child: Text(
                                                      item.text,
                                                      style: CommonUi
                                                          .setCustomTextStyle(
                                                              textSize: 14.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          })
                                  : controller.product!.description.isEmpty
                                      ? SizedBox(
                                          height: 100,
                                          width: Get.width,
                                          child: Center(
                                            child: Text(
                                              'No Reviews Found',
                                              style:
                                                  CommonUi.setCustomTextStyle(
                                                      textSize: 14.0),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          margin: const EdgeInsets.all(20.0),
                                          child: HtmlWidget(
                                              controller.product!.description)),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {
                                  Get.find<HomeController>()
                                      .addProductToWishlist(
                                          controller.product!.productId);
                                },
                                child: const Icon(Icons.favorite_border,
                                    color: ColorRes.colorPrimary, size: 30),
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0)),
                                        color: ColorRes.colorWhite,
                                        border: Border.all(
                                            color: ColorRes.colorLightGrey)),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            controller.updateQuantity(false);
                                          },
                                          child: Image.asset(
                                              CommonUi.setPngImage('minus'),
                                              height: 35,
                                              width: 35),
                                        ),
                                        Text(
                                          '   ${controller.quantity.value}   ',
                                          style: CommonUi.setCustomTextStyle(
                                              textFont: Fonts.fontMedium,
                                              textSize: 18.0),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.updateQuantity(true);
                                          },
                                          child: Image.asset(
                                              CommonUi.setPngImage('add'),
                                              height: 35,
                                              width: 35),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: CommonUi.setButton(
                                    buttonText: Strings.textAddToCart,
                                    onTap: () {
                                      controller.addProductToCart();
                                    }),
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                          const SizedBox(height: 20),
                          if (controller
                              .relatedProductList.value.isNotEmpty) ...{
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Related Products',
                                style: CommonUi.setCustomTextStyle(
                                    textColor: ColorRes.colorLightBlue,
                                    textSize: 18.0,
                                    textFont: Fonts.fontLailaBold),
                              ),
                            ),
                            SizedBox(
                              height: 255,
                              child: ListView.builder(
                                itemCount:
                                    controller.relatedProductList.value.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  var item = controller
                                      .relatedProductList.value[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Get.back();
                                      Constants.hideKeyboard();
                                      Timer(const Duration(seconds: 1), () {
                                        Get.toNamed(Routes().productDetails,
                                            arguments: item.productId);
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 150,
                                          margin: EdgeInsets.only(
                                              right: 10,
                                              top: 25,
                                              left: index == 0 ? 10 : 0),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            color: ColorRes.colorGrey2,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonUi.setNetworkImage(
                                                    item.thumb,
                                                    imageHeight: 120,
                                                    imageWidth: 120,
                                                    radius: 20.0),
                                                const SizedBox(height: 10),
                                                Text(
                                                  item.name,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: CommonUi
                                                      .setCustomTextStyle(
                                                          textFont:
                                                              Fonts.fontBold,
                                                          textColor: ColorRes
                                                              .colorLightBlue),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  'Rs: ${item.price}',
                                                  style: CommonUi
                                                      .setCustomTextStyle(
                                                          textFont:
                                                              Fonts.fontMedium,
                                                          textSize: 14.0),
                                                ),
                                                const SizedBox(height: 5),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.find<HomeController>()
                                                        .addProductToCart(
                                                            item.productId);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        Strings.textAddToCart,
                                                        style: CommonUi
                                                            .setCustomTextStyle(
                                                                textFont: Fonts
                                                                    .fontMedium,
                                                                textSize: 12.0,
                                                                textColor: ColorRes
                                                                    .colorPrimary),
                                                      ),
                                                      const Icon(
                                                        Icons.add_shopping_cart,
                                                        color: ColorRes
                                                            .colorPrimary,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: 10,
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.find<HomeController>()
                                                    .addProductToWishlist(
                                                        item.productId);
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.0)),
                                                  color: ColorRes.colorGrey2,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: const Icon(
                                                    Icons.favorite_border,
                                                    color:
                                                        ColorRes.colorPrimary),
                                              ),
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                          },
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
        ),
      );
    });
  }
}
