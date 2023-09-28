import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/screens/dashboard/profile/promos/promo_controller.dart';

class PromoView extends StatelessWidget {
  const PromoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (PromoController controller){
      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 50,
          centerTitle: true,
          title: Text(
            Strings.textPromo,
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: controller.couponsList.value.length,
              itemBuilder: (BuildContext context, int index) {
                var item = controller.couponsList[index];
            return SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Image.asset(CommonUi.setPngImage('promo_img'),
                      fit: BoxFit.fill),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              '${item.discount}%',
                              style: CommonUi.setCustomTextStyle(
                                  textSize: 24.0,
                                  textFont: Fonts.fontLailaBold,
                                  textColor: ColorRes.colorWhite),
                            ),
                          ),
                        ),
                        Image.asset(
                          CommonUi.setPngImage('line_img'),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                item.name,
                                style: CommonUi.setCustomTextStyle(
                                    textSize: 18.0,
                                    textFont: Fonts.fontLailaBold,
                                    textColor: ColorRes.colorWhite),
                              ),
                              Text(
                                'Expire: ${item.dateEnd}',
                                style: CommonUi.setCustomTextStyle(
                                    textSize: 14.0,
                                    textColor: ColorRes.colorWhite),
                              ),
                              GestureDetector(
                                onTap:(){
                                  if(controller.openFrom.value == 'cart') {
                                    Get.back(result: item.code);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    color: Colors.white30,
                                  ),
                                  child: Text(
                                    'Collect',
                                    style: CommonUi.setCustomTextStyle(
                                        textSize: 14.0,
                                        textColor: ColorRes.colorWhite,textFont: Fonts.fontSemiBold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      );
    });
  }
}
