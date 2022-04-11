import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_filled_button.dart';

class ErrorDialoge extends StatelessWidget {
  String? message;
  Function? onTapOk;

  ErrorDialoge({this.message, this.onTapOk});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ALERT',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.red, fontSize: 20),
          ),
          Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 25,
          )
        ],
      ),
      content: Text(
        message!,
        style: TextStyle(fontSize: 16),
      ),
      actions: <Widget>[
        MyFilledButton(
          color: AppColors.pink,
          width: 60,
          height: 35,
          ontap: () {
            Get.back();
          },
          txt: "OK",
          borderRadius: 5,
        ),
      ],
    );
  }
}
