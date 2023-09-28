import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/orders/orders_controller.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              CommonUi.setPngImage('order_success'),
              scale: 2.5,
            ),
            const SizedBox(height: 20),
            Text(
              Strings.textSucess,
              style: CommonUi.setCustomTextStyle(
                  textFont: Fonts.fontLailaBold,
                  textColor: ColorRes.colorLightBlue,
                  textSize: 24.0),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                Strings.textThankYouOrder,
                style: CommonUi.setCustomTextStyle(
                  textColor: ColorRes.colorLightBlue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            CommonUi.setButton(
                buttonText: Strings.textContinue, onTap: () {
                  Get.until((route) => route.isFirst);
                    Get.find<OrdersController>().getOrders();

            }),
            // CommonUi.setButton(
            //   buttonColor: ColorRes.colorSecondary,
            //     buttonTextColor: ColorRes.colorPrimary,
            //     buttonText: Strings.textTrackYourOrder, onTap: () {
            //     Get.toNamed(Routes().trackOrder);
            // }),
          ],
        ),
      ),
    );
  }
}
