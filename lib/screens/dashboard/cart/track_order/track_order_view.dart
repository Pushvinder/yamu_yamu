import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/cart/track_order/track_order_controller.dart';

class TrackOrderView extends StatelessWidget {
   TrackOrderView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetX(builder: (TrackOrderController controller){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 50,
          centerTitle: true,
          title: Text(
            Strings.textTrackOrder,
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [


                OrderTracker(
                  status: controller.orderStatus,
                  activeColor: ColorRes.colorPrimary,
                  headingDateTextStyle: const TextStyle(color: Colors.white),
                  inActiveColor: Colors.grey[300],
                  orderTitleAndDateList: controller.orderList,
                  shippedTitleAndDateList:controller.shippedList,
                  outOfDeliveryTitleAndDateList: controller.outOfDeliveryList,
                  deliveredTitleAndDateList: controller.deliveredList,
                ),
                const SizedBox(height: 20),
                controller.showFailedOrder.value
                    ? Text(
                  'Your Order has Failed',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
                    : const SizedBox(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    });
  }
}
