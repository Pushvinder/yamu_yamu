import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Constants.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/wishlist/wishlist_controller.dart';

import '../../../constants/ColorRes.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 50,
          centerTitle: true,
          title: Text(
            Strings.textWishlist,
            style: CommonUi.setCustomTextStyle(
                textSize: 20.0,
                textFont: Fonts.fontLailaBold,
                textColor: ColorRes.colorPrimary),
          ),
          // leading: GestureDetector(
          //   onTap: () {
          //     Get.back();
          //   },
          //   child: const Padding(
          //       padding: EdgeInsets.only(left: 20),
          //       child: Icon(
          //         Icons.arrow_back,
          //         color: ColorRes.colorLightBlue,
          //       )),
          // ),
        ),
        body: GetX(builder: (WishlistController controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 15,
                  childAspectRatio: 2 / 3.5),
              itemCount: controller.wishlistProductList.value.length,
              itemBuilder: (BuildContext context, int index) {
                var item = controller.wishlistProductList[index];
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes().productDetails,arguments: item.productId);
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
                          Expanded(
                            child: CommonUi.setNetworkImage(item.thumb,
                                imageWidth: Get.width),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.name,
                            maxLines: 2,
                            style: CommonUi.setCustomTextStyle(
                                textFont: Fonts.fontBold, textSize: 20.0),
                            overflow: TextOverflow.ellipsis,
                          ),
                          // const SizedBox(height: 10),
                          // Text(
                          //   'LaMuse',
                          //   style: CommonUi.setCustomTextStyle(
                          //       textFont: Fonts.fontMedium,
                          //       textSize: 14.0,
                          //       textColor: ColorRes.colorGrey),
                          // ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child:      Row(
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
                              ),
                              GestureDetector(
                                onTap: (){
                                  controller.removeProductToWishlist(item.productId,index);
                                },
                                  child: const Icon(Icons.favorite,
                                      color: ColorRes.colorPrimary)),
                              const SizedBox(width: 5),
                              GestureDetector(
                               onTap: (){
                                 controller.addProductToCart(item.productId);
                               },
                                child: Image.asset(CommonUi.setPngImage('add'),
                                    height: 24, width: 24),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }));
  }
}
