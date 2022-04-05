import 'package:ebazar/view/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class SimpleAppBar extends StatelessWidget {

  String title;

  SimpleAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.west_outlined,
                color: AppColors.blueAccent,
              )),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style:  TextStyle(color: AppColors.blueAccent, fontSize: 20.sp),
          ),
        ],
      ),
    );;
  }
}
