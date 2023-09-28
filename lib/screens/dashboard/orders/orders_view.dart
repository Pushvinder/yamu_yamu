import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/orders/orders_controller.dart';
import '../../../constants/Fonts.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (OrdersController controller) {
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.textProcessing,
                  style: CommonUi.setCustomTextStyle(
                      textColor: ColorRes.colorLightBlue,
                      textSize: 18.0,
                      textFont: Fonts.fontLailaBold),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.ordersList.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = controller.ordersList.value[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes().orderDetails,
                              arguments: item.orderId);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: ColorRes.colorGrey2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CommonUi.setNetworkImage('',
                                        imageWidth: 80,
                                        imageHeight: 80,
                                        radius: 20.0),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order ID: #${item.orderId}',
                                            style: CommonUi.setCustomTextStyle(
                                                textColor:
                                                    ColorRes.colorLightBlue,
                                                textFont: Fonts.fontBold),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${item.products} products',
                                                style: CommonUi
                                                    .setCustomTextStyle(),
                                              ),
                                              Text(
                                                'Rs: ${item.total}',
                                                style:
                                                    CommonUi.setCustomTextStyle(
                                                        textFont:
                                                            Fonts.fontBold),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  item.dateAdded,
                                                  style: CommonUi
                                                      .setCustomTextStyle(),
                                                ),
                                              ),
                                              Text(
                                                item.status,
                                                style: CommonUi
                                                    .setCustomTextStyle(textColor: ColorRes.colorPrimary),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CommonUi.setButton(
                                          buttonText: Strings.textTrackOrder,
                                          onTap: () {
                                            controller.trackOrder(item.orderId);
                                          }),
                                    ),
                                    Expanded(
                                        child: CommonUi.setButton(
                                            buttonColor:
                                                ColorRes.colorLightGrey,
                                            buttonTextColor: ColorRes.colorGrey,
                                            buttonText:
                                                Strings.textCancelOrders,
                                            onTap: () {
                                              controller.cancelOrders(
                                                  item.orderId, index);
                                            }))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                const SizedBox(height: 20),
                // Text(
                //   Strings.textHistory,
                //   style: CommonUi.setCustomTextStyle(
                //       textColor: ColorRes.colorLightBlue,
                //       textSize: 18.0,
                //       textFont: Fonts.fontLailaBold),
                // ),
                // const SizedBox(height: 15),
                // ListView.builder(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: 3,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Container(
                //         margin: const EdgeInsets.symmetric(vertical: 5),
                //         decoration: const BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //           color: ColorRes.colorGrey2,
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.all(15),
                //           child: Column(
                //             children: [
                //               Row(
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.circular(20.0),
                //                     child: Image.network(
                //                       'https://images.unsplash.com/photo-1522069169874-c58ec4b76be5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=412&q=80',
                //                       height: 80,
                //                       width: 80,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   const SizedBox(width: 20),
                //                   Expanded(
                //                     child: Column(
                //                       crossAxisAlignment: CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Order ID: #2394KL',
                //                           style: CommonUi.setCustomTextStyle(
                //                               textColor: ColorRes.colorLightBlue,
                //                               textFont: Fonts.fontBold),
                //                         ),
                //                         const SizedBox(height: 10),
                //                         Row(
                //                           mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               '5 products',
                //                               style: CommonUi.setCustomTextStyle(),
                //                             ),
                //                             Text(
                //                               'Rs: 320',
                //                               style: CommonUi.setCustomTextStyle(
                //                                   textFont: Fonts.fontBold),
                //                             ),
                //                           ],
                //                         ),
                //                         const SizedBox(height: 10),
                //                         Text(
                //                           '12/1/2021    14:35 pm',
                //                           style: CommonUi.setCustomTextStyle(),
                //                         ),
                //                       ],
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
