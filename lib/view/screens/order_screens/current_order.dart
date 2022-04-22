import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:ebazar/view/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class CurrentOrder extends StatelessWidget {
  const CurrentOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.pink,
                )),
            const Text(
              "Order",
              style: TextStyle(color: AppColors.black),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.clear,
                color: AppColors.pink,
              ))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 100.w,),
          Container(
            margin: EdgeInsets.only(right: 5, left: 5),
            height: 12.h,
            width: 12.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,
                  )
                ]),
            child: Center(
              child: IconButton(
                onPressed: () {
                  // Get.to(SeeAllCategories());
                },
                iconSize: 30.sp,
                icon: const Icon(
                  Icons.check,
                  color: AppColors.pink,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.sp,),
          Text('Order Placed ! ',style: TextStyle(fontSize: 23.sp),),
          SizedBox(height: 15.sp,),
          Text('Your order was placed successfully. For more details, check All My Orders page under Profile tab',textAlign:TextAlign.center,),
          SizedBox(height: 15.sp,),
          SizedBox(
              width: 45.w,
              child: MyButton(buttonText: 'My Orders', onPressed: (){}))

        ],
      ),
    ));
  }
}
