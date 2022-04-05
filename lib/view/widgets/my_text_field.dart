
import 'package:ebazar/view/app_colors/app_colors.dart';
import 'package:ebazar/view/app_colors/styles.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController ? controller;
  String ?label;
  bool? obsecureText =false;
  IconButton ?suffixIcon;
  final ValueChanged<String>? onChanged;
  Function? onEditingComplete;
  GestureTapCallback ?onTap;
  bool ?enabled=true;
  int? maxLines;
  String ?hintText;
  TextInputType ?keyboardType;
  bool ?autoFocus;
  double ?height;
  double? width;
  int? maxLength;
  FocusNode ?focusNode;
  bool ?phoneNumber=false;
  bool? disableborder=false;
  double ?borderRadiusCircular;
  ///Constructor
  MyTextField({
    @required this.controller,
    @required this.label,
    this.obsecureText,
    this.onChanged,
    this.suffixIcon,
    this.onEditingComplete,
    this.enabled,
    this.onTap,
    this.maxLines,
    this.hintText,
    this.keyboardType,
    this.autoFocus,
    this.height,
    this.width,
    this.maxLength,
    this.focusNode,
    this.phoneNumber,
    this.disableborder,
    this.borderRadiusCircular,
  });

  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;
    return Container(
      height: height??45,
      width: width,
      child: GestureDetector(
        onTap: onTap,
        child: TextField(
          focusNode: focusNode,
          maxLength: maxLength,
          autofocus: autoFocus??false,
          keyboardType: keyboardType,
          maxLines: maxLines??1,
          enabled: enabled,
          onTap: onTap,
          onEditingComplete: (){
            onEditingComplete!();
          },
          onChanged:onChanged,
          controller: controller,
          obscureText: obsecureText??false,
          cursorColor: AppColors.pink,
          style: phoneNumber??false ? Styles.phoneNumberTextStyle() : Styles.textFieldTextStyle(),
          decoration: disableborder??false
              ? InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            fillColor: Colors.white,
            filled: true,
            focusColor: AppColors.pink,
            hoverColor: AppColors.pink,
            labelText: label,
            hintStyle: const TextStyle(
                color: Colors.black54,
                fontSize: 16
            ),
            labelStyle: const TextStyle(
                color: AppColors.grey,
                fontSize: 16,height: 0
            ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(borderRadiusCircular??25.0),
            //   borderSide: BorderSide.none,
            // ),
          )
              : InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            // fillColor: ColorPalette.grey,
              filled: true,
              focusColor: AppColors.pink,
              hoverColor:AppColors.pink,
              labelText: label,
              hintStyle: const TextStyle(
                color: Colors.black54,
                fontSize: 16
              ),
              labelStyle: const  TextStyle(
                color: AppColors.pink,
                fontSize: 16
              ),
              disabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.pink
                  )
              ),
              enabledBorder:   OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.pink
                  )
              ),
              focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                      color:AppColors.pink
                  )
              ),
              border:  OutlineInputBorder(
                borderSide: BorderSide(
                  color:AppColors.pink
                )
              ),
          ),
        ),
      ),
    );
  }
}
