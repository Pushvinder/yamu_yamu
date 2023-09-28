import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonTextFeild.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Constants.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/home/my_home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (HomeController controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorRes.colorPrimary,
          shadowColor: Colors.transparent,
          leadingWidth: Get.width/2.2,
          toolbarHeight: 60,
          centerTitle: true,
          leading: Center(
            child: Text(
              "Hi, ${controller.userName.value}",
              maxLines: 1,
              style: CommonUi.setCustomTextStyle(
                  textSize: 20.0,
                  textFont: Fonts.fontLailaBold,
                  textColor: ColorRes.colorWhite),
            ),
          ),
          title: Image.asset(CommonUi.setPngImage('yamu_logo'),
              height: 40, width: 30, fit: BoxFit.fill),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes().search);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: ColorRes.colorPrimary,
                height: 60,
                child: CommonUi.searchField(false,
                    Strings.textSearchForProducts, TextEditingController(),onValueChanged: (v){}),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.bannerList.value.isNotEmpty) ...{
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: Get.width,
                        height: 160,
                        child: PageView.builder(
                            itemCount: controller.bannerList.value.length,
                            onPageChanged: (value) {
                              controller.bannerCurrentIndex.value = value;
                            },
                            itemBuilder: (context, index) {
                              var item = controller.bannerList[index].image;
                              return Container(
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),

                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        CommonUi.setPngImage('yamu_logo'),
                                    imageErrorBuilder: (context, error, i) =>
                                        Image.asset(
                                            CommonUi.setPngImage('yamu_logo')),
                                    image: Constants.imageBaseUrl + item,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                      ),
                      Center(
                        child: DotsIndicator(
                          decorator: const DotsDecorator(
                              activeColor: ColorRes.colorPrimary,
                              color: ColorRes.colorLightGrey),
                          dotsCount: controller.bannerList.value.length,
                          position: controller.bannerCurrentIndex.value,
                        ),
                      ),
                    },
                    const SizedBox(height: 10),
                    if (controller.categoryList.value.isNotEmpty) ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          Strings.textShopByCategory,
                          style: CommonUi.setCustomTextStyle(
                              textColor: ColorRes.colorLightBlue,
                              textSize: 18.0,
                              textFont: Fonts.fontLailaBold),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 130,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.categoryList.value.length,
                            itemBuilder: (BuildContext context, int index) {
                              var item = controller.categoryList.value[index];
                              return GestureDetector(
                                onTap:(){
                                  controller.getCategoryProducts(item.categoryId);
                                },
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  margin: EdgeInsets.only(
                                      right: 15, left: index == 0 ? 15 : 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonUi.setNetworkImage(item.image,imageWidth: 80,imageHeight: 80,
                                          radius: 100.0),
                                      const SizedBox(height: 8),
                                      Text(
                                        item.name,
                                        maxLines: 2,
                                        style: CommonUi.setCustomTextStyle(
                                            textColor: ColorRes.colorLightBlue,
                                            textFont: Fonts.fontBold),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(height: 20),
                    },

                    if (controller.specialProductList.value.isNotEmpty) ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Special Products',
                          style: CommonUi.setCustomTextStyle(
                              textColor: ColorRes.colorLightBlue,
                              textSize: 18.0,
                              textFont: Fonts.fontLailaBold),
                        ),
                      ),
                      SizedBox(
                        height: 255,
                        child: ListView.builder(
                          itemCount: controller.specialProductList.value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var item =
                            controller.specialProductList.value[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes().productDetails,arguments: item.productId);
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
                                          CommonUi.setNetworkImage(item.thumb,
                                              imageHeight: 120,
                                              imageWidth: 120,
                                              radius: 20.0),
                                          const SizedBox(height: 10),
                                          Text(
                                            item.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: CommonUi.setCustomTextStyle(
                                                textFont: Fonts.fontBold,
                                                textColor:
                                                ColorRes.colorLightBlue),
                                          ),
                                          const SizedBox(height: 5),
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
                                          const SizedBox(height: 5),
                                          GestureDetector(
                                            onTap: () {
                                              controller.addProductToCart(
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
                                                      textFont:
                                                      Fonts.fontMedium,
                                                      textSize: 12.0,
                                                      textColor: ColorRes
                                                          .colorPrimary),
                                                ),
                                                const Icon(
                                                  Icons.add_shopping_cart,
                                                  color: ColorRes.colorPrimary,
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
                                          controller.addProductToWishlist(
                                              item.productId);
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            color: ColorRes.colorGrey2,
                                          ),
                                          padding: const EdgeInsets.all(5),
                                          child: const Icon(
                                              Icons.favorite_border,
                                              color: ColorRes.colorPrimary),
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

                    if (controller.jewelleryProductList.value.isNotEmpty) ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Shop by jewellery',
                          style: CommonUi.setCustomTextStyle(
                              textColor: ColorRes.colorLightBlue,
                              textSize: 18.0,
                              textFont: Fonts.fontLailaBold),
                        ),
                      ),
                      SizedBox(
                        height: 255,
                        child: ListView.builder(
                          itemCount: controller.jewelleryProductList.value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var item =
                                controller.jewelleryProductList.value[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes().productDetails,arguments: item.productId);
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
                                          CommonUi.setNetworkImage(item.thumb,
                                              imageHeight: 120,
                                              imageWidth: 120,
                                              radius: 20.0),
                                          const SizedBox(height: 10),
                                          Text(
                                            item.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: CommonUi.setCustomTextStyle(
                                                textFont: Fonts.fontBold,
                                                textColor:
                                                    ColorRes.colorLightBlue),
                                          ),
                                          const SizedBox(height: 5),
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

                                          const SizedBox(height: 5),
                                          GestureDetector(
                                            onTap: () {
                                              controller.addProductToCart(
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
                                                          textFont:
                                                              Fonts.fontMedium,
                                                          textSize: 12.0,
                                                          textColor: ColorRes
                                                              .colorPrimary),
                                                ),
                                                const Icon(
                                                  Icons.add_shopping_cart,
                                                  color: ColorRes.colorPrimary,
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
                                          controller.addProductToWishlist(
                                              item.productId);
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            color: ColorRes.colorGrey2,
                                          ),
                                          padding: const EdgeInsets.all(5),
                                          child: const Icon(
                                              Icons.favorite_border,
                                              color: ColorRes.colorPrimary),
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

                    if (controller.latestProductList.value.isNotEmpty) ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Latest Products',
                          style: CommonUi.setCustomTextStyle(
                              textColor: ColorRes.colorLightBlue,
                              textSize: 18.0,
                              textFont: Fonts.fontLailaBold),
                        ),
                      ),
                      SizedBox(
                        height: 255,
                        child: ListView.builder(
                          itemCount: controller.latestProductList.value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var item =
                            controller.latestProductList.value[index];
                            return GestureDetector(
                              onTap: (){
                                Get.toNamed(Routes().productDetails,arguments: item.productId);
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
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                      color: ColorRes.colorGrey2,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(20.0),
                                            child: Image.network(
                                              Constants.imageBaseUrl + item.thumb,
                                              fit: BoxFit.cover,
                                              width: 120,
                                              height: 120,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            item.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: CommonUi.setCustomTextStyle(
                                                textFont: Fonts.fontBold,
                                                textColor:
                                                ColorRes.colorLightBlue),
                                          ),
                                          const SizedBox(height: 5),
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

                                          const SizedBox(height: 5),
                                          GestureDetector(
                                            onTap: () {
                                              controller.addProductToCart(
                                                  item.productId);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  Strings.textAddToCart,
                                                  style:
                                                  CommonUi.setCustomTextStyle(
                                                      textFont:
                                                      Fonts.fontMedium,
                                                      textSize: 12.0,
                                                      textColor: ColorRes
                                                          .colorPrimary),
                                                ),
                                                const Icon(
                                                  Icons.add_shopping_cart,
                                                  color: ColorRes.colorPrimary,
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
                                          controller
                                              .addProductToCart(item.productId);
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            color: ColorRes.colorGrey2,
                                          ),
                                          padding: const EdgeInsets.all(5),
                                          child: const Icon(Icons.favorite_border,
                                              color: ColorRes.colorPrimary),
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


                    if (controller.beautyProductList.value.isNotEmpty) ...{
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Shop by beauty',
                          style: CommonUi.setCustomTextStyle(
                              textColor: ColorRes.colorLightBlue,
                              textSize: 18.0,
                              textFont: Fonts.fontLailaBold),
                        ),
                      ),
                      SizedBox(
                        height: 255,
                        child: ListView.builder(
                          itemCount: controller.beautyProductList.value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            var item =
                                controller.beautyProductList.value[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes().productDetails,arguments: item.productId);
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
                                          CommonUi.setNetworkImage(item.thumb,
                                              imageHeight: 120,
                                              imageWidth: 120,
                                              radius: 20.0),
                                          const SizedBox(height: 10),
                                          Text(
                                            item.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: CommonUi.setCustomTextStyle(
                                                textFont: Fonts.fontBold,
                                                textColor:
                                                    ColorRes.colorLightBlue),
                                          ),
                                          const SizedBox(height: 5),
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

                                          const SizedBox(height: 5),
                                          GestureDetector(
                                            onTap: () {
                                              controller.addProductToCart(
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
                                                          textFont:
                                                              Fonts.fontMedium,
                                                          textSize: 12.0,
                                                          textColor: ColorRes
                                                              .colorPrimary),
                                                ),
                                                const Icon(
                                                  Icons.add_shopping_cart,
                                                  color: ColorRes.colorPrimary,
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
                                          controller.addProductToWishlist(
                                              item.productId);
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            color: ColorRes.colorGrey2,
                                          ),
                                          padding: const EdgeInsets.all(5),
                                          child: const Icon(
                                              Icons.favorite_border,
                                              color: ColorRes.colorPrimary),
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


                    if (controller.bottomBannerList.value.isNotEmpty) ...{
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: Get.width,
                        height: 160,
                        child: PageView.builder(
                            itemCount: controller.bottomBannerList.value.length,
                            onPageChanged: (value) {
                              controller.bottomBannerCurrentIndex.value = value;
                            },
                            itemBuilder: (context, index) {
                              var item = controller.bottomBannerList[index].image;
                              return Container(
                                margin: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                    CommonUi.setPngImage('yamu_logo'),
                                    imageErrorBuilder: (context, error, i) =>
                                        Image.asset(
                                            CommonUi.setPngImage('yamu_logo')),
                                    image: Constants.imageBaseUrl + item,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }),
                      ),
                      Center(
                        child: DotsIndicator(
                          decorator: const DotsDecorator(
                              activeColor: ColorRes.colorPrimary,
                              color: ColorRes.colorLightGrey),
                          dotsCount: controller.bottomBannerList.value.length,
                          position: controller.bottomBannerCurrentIndex.value,
                        ),
                      ),
                      const SizedBox(height: 10),
                    },
                    const SizedBox(height: 25)
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
