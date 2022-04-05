
import 'package:ebazar/view/app_colors/app_colors.dart';
import 'package:flutter/material.dart';


class Styles{

  static TextStyle textFieldlabelTextStyle(){
   return TextStyle(
     fontSize: 15,
        fontWeight: FontWeight.normal,
        color: AppColors.pink
    );
  }
  static TextStyle textFieldTextStyle(){
    return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: AppColors.pink
    );
  }
  static TextStyle labelTextStyle(){
    return TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.pink
    );
  }
  static TextStyle homeScreenListItemTextStyle(){
    return TextStyle(
        color: Colors.blue[700],
      fontSize: 15,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle phoneNumberTextStyle(){
    return TextStyle(
        fontSize: 20,
        letterSpacing: 3
      // fontWeight: FontWeight.bold
    );
  }

}