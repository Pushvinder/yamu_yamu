import 'package:flutter/material.dart';
import 'package:yamu/constants/ColorRes.dart';
import 'package:yamu/constants/CommonUi.dart';

class CommonTextField extends StatelessWidget {
  String? title;
  String? hintText;
  TextEditingController? textController;
  bool? fixedHeight;
  bool? showTitle;
  bool? fieldEnable;
  TextStyle ? style;
  Color? cursorColor;

  CommonTextField({
    Key? key,
    this.title,
    this.hintText,
    this.textController,
    this.fixedHeight = false,
    this.showTitle = true,
    this.fieldEnable = true,
    this.style,
    this.cursorColor = ColorRes.colorPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showTitle! ? Text(title.toString(), style:style) : const SizedBox(),
        const SizedBox(height: 10),
        TextFormField(
          cursorColor: cursorColor,
          maxLines: fixedHeight! ? 3 : 1,
          controller: textController,
          style: style,
          decoration: InputDecoration(
              enabledBorder:  const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorRes.colorLightGrey),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorRes.colorLightGrey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorRes.colorLightGrey),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorRes.colorLightGrey),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ColorRes.colorLightGrey),
              ),
              fillColor: Colors.transparent,
              focusColor: Colors.transparent,
              isDense: true,
              hintText: hintText,
              hintStyle: CommonUi.setCustomTextStyle(textColor: ColorRes.colorGrey,textSize: 14.0),
              enabled: fieldEnable!,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12.0),
              filled: true),
        ),
      ],
    );
  }
}
