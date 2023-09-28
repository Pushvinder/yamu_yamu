import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/home/my_home/home_controller.dart';

class CategoryProducts extends StatelessWidget {
   CategoryProducts({Key? key}) : super(key: key);
final  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // return GetX(builder: (HomeController controller){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 50,
          centerTitle: true,
          title: Text(
            Strings.textProducts,
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            padding: const EdgeInsets.only(bottom: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 2 / 3),
            itemCount: controller.categoryProductsList.length,
            itemBuilder: (BuildContext context, int index) {
              var item = controller.categoryProductsList.value[index];
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
                          style: CommonUi.setCustomTextStyle(
                              textFont: Fonts.fontBold, textSize: 20.0),
                        ),
                        // const SizedBox(height: 10),
                        // Text(
                        //   '',
                        //   style: CommonUi.setCustomTextStyle(
                        //       textFont: Fonts.fontMedium,
                        //       textSize: 14.0,
                        //       textColor: ColorRes.colorGrey),
                        // ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Rs: ${item.price}',
                                style: CommonUi.setCustomTextStyle(
                                    textFont: Fonts.fontMedium, textSize: 12.0),
                              ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  controller.addProductToWishlist(item.productId);
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
        ),
      );
    // });
  }
}
