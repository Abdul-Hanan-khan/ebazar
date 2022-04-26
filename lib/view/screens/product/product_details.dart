import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.pink,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: AppColors.black,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    color: Colors.black,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
