import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
class TopBarSearch extends StatelessWidget {
  const TopBarSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 9.h,
      width: Get.width,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            width: 55.w,
            height: 5.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.grey)
            ),
            child: Row(
              children:  [
                Icon(Icons.search,color: AppColors.pink,),
                SizedBox(width: 7,),
                Text('Search Something',style: TextStyle(color: AppColors.grey,fontSize: 15.sp),)
              ],
            ),
          ),

          Row(
            children: [
              Container(
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Image.asset('assets/icons/Messages.png',height: 22.sp,width: 22.sp,fit: BoxFit.contain,),
                    Positioned(
                      top: 15.sp,
                      right: 15.sp,
                      child: Container(
                        width: 18.sp,
                        height: 18.sp,
                        decoration: BoxDecoration(
                            color: AppColors.pink,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Center(
                          child: Text('1',style: TextStyle(
                              color: AppColors.white
                          ),),
                        ),
                      ),
                    )
                  ],

                ),
              ),
              SizedBox(width: 15.sp,),
              Container(
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Image.asset('assets/icons/notifications.png',height: 22.sp,width: 22.sp,fit: BoxFit.contain,),
                    Positioned(
                      top: 15.sp,
                      right: 15.sp,
                      child: Container(
                        width: 18.sp,
                        height: 18.sp,
                        decoration: BoxDecoration(
                            color: AppColors.pink,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Center(
                          child: Text('1',style: TextStyle(
                              color: AppColors.white
                          ),),
                        ),
                      ),
                    )
                  ],

                ),
              ),
            ],
          )
        ],
      ),

    );
  }
}
