import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonTextFeild.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Constants.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/screens/dashboard/home/product_detail/review/review_controller.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(builder: (ReviewController controller){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leadingWidth: 50,
          centerTitle: true,
          title: Text(
            Strings.textReview,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: ColorRes.colorGrey2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                           Constants.imageBaseUrl + controller.productImage.value,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              controller.productName.value,
                                style: CommonUi.setCustomTextStyle(
                                    textFont: Fonts.fontLailaBold,
                                    textSize: 14.0),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                controller.productAdditionalName.value,
                                style: CommonUi.setCustomTextStyle(
                                    textFont: Fonts.fontMedium, textSize: 12.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      controller.rating.value = rating.toInt().toString();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    '${controller.rating.value}/5',
                    style: CommonUi.setCustomTextStyle(
                        textFont: Fonts.fontBold,textColor: ColorRes.colorLightBlue,
                        textSize: 30.0),
                  ),
                ),
                CommonTextField(
                  textController: controller.commentController,
                  style: CommonUi.setCustomTextStyle(
                      textFont: Fonts.fontSemiBold),
                  title: Strings.textComment,
                  fixedHeight: true,
                  hintText: Strings.textLeaveComment,
                ),
                const SizedBox(height: 20),
                CommonUi.setButton(
                    buttonText: Strings.textSendReview, onTap: () {
                      controller.submitReview();
                }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
