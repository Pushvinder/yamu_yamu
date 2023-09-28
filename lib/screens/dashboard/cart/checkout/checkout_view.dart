import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';
import 'package:yamu/constants/Fonts.dart';
import 'package:yamu/constants/Strings.dart';
import 'package:yamu/routes/Routes.dart';
import 'package:yamu/screens/dashboard/cart/checkout/order_success_view.dart';
import 'package:yamu/screens/dashboard/cart/my_cart/cart_controller.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leadingWidth: 50,
        centerTitle: true,
        title: Text(
          Strings.textCheckOut,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.textPaymentByUpi,
                style: CommonUi.setCustomTextStyle(
                    textSize: 16.0, textFont: Fonts.fontLailaBold),
              ),
              const SizedBox(height: 20),
              Image.asset(CommonUi.setPngImage('qrcode'),
                  height: 250, width: 250, fit: BoxFit.cover),
              const SizedBox(height: 20),
              Text(
                Strings.textBankTransferDetail,
                style: CommonUi.setCustomTextStyle(
                    textSize: 16.0, textFont: Fonts.fontLailaBold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(Strings.textAccName,
                        style: CommonUi.setCustomTextStyle(
                            textColor: ColorRes.colorLightBlue)),
                  ),
                  Text('Neptune Solution',
                      style: CommonUi.setCustomTextStyle(
                          textFont: Fonts.fontBold)),
                ],
              ),
           const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(Strings.textAccNo,
                        style: CommonUi.setCustomTextStyle(
                            textColor: ColorRes.colorLightBlue)),
                  ),
                  Text('6646624364',
                      style: CommonUi.setCustomTextStyle(
                          textFont: Fonts.fontBold)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(Strings.textBankName,
                        style: CommonUi.setCustomTextStyle(
                            textColor: ColorRes.colorLightBlue)),
                  ),
                  Text(' INDIAN BANK',
                      style: CommonUi.setCustomTextStyle(
                          textFont: Fonts.fontBold)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text('Acc Type',
                        style: CommonUi.setCustomTextStyle(
                            textColor: ColorRes.colorLightBlue)),
                  ),
                  Text('Current Account',
                      style: CommonUi.setCustomTextStyle(
                          textFont: Fonts.fontBold)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(Strings.textIfscCode,
                        style: CommonUi.setCustomTextStyle(
                            textColor: ColorRes.colorLightBlue)),
                  ),
                  Text('IDIB000C073 (5th character is zero)',
                      style: CommonUi.setCustomTextStyle(
                          textFont: Fonts.fontBold)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(Strings.textSwiftCode,
                        style: CommonUi.setCustomTextStyle(
                            textColor: ColorRes.colorLightBlue)),
                  ),
                  Text('160019003',
                      style: CommonUi.setCustomTextStyle(
                          textFont: Fonts.fontBold)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(Strings.textBranchCode,
                        style: CommonUi.setCustomTextStyle(
                            textColor: ColorRes.colorLightBlue)),
                  ),
                  Text('00C073',
                      style: CommonUi.setCustomTextStyle(
                          textFont: Fonts.fontBold)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text('Branch',
                        style: CommonUi.setCustomTextStyle(
                            textColor: ColorRes.colorLightBlue)),
                  ),
                  Text('Chandigarh',
                      style: CommonUi.setCustomTextStyle(
                          textFont: Fonts.fontBold)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${Strings.textNote} : ',
                      style: CommonUi.setCustomTextStyle(
                          textColor: Colors.red,textFont: Fonts.fontLailaBold)),
                  Expanded(
                    child: Text(Strings.textSubmitOrderSlip,
                        style: CommonUi.setCustomTextStyle(
                            textFont: Fonts.fontBold)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CommonUi.setButton(
                  buttonText: Strings.textPlaceOrder, onTap: () {
                    Get.find<CartController>().checkout();
              })
            ],
          ),
        ),
      ),
    );
  }
}
