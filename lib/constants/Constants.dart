
import 'package:flutter/material.dart';

class Constants {

 static double appStartEndMargin = 20.0;

 static String imageBaseUrl = 'https://yamuindia.com/image/';


 static hideKeyboard(){
  FocusManager.instance.primaryFocus?.unfocus();
 }

}