import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SeeAllCategories extends StatelessWidget {
  const SeeAllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.appBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon:  Icon(
                        Icons.clear,
                        color: AppColors.pink,
                        size: 28.sp,
                      ))
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'All Categories',
                  style:
                      TextStyle(fontSize: 21.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  allCategoriesList(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    width: 70.w,
                    height: 86.h,
                    child: ListView(
                      children: [
                        mensApparel(),
                        womenApparel(),
                      ],
                    ) ,
                  )

                  // allCategoriesList(),
                  // mensApparel(),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget allCategoriesList() {
    return Container(
      width: 25.w,
      height: 86.h,
      child: ListView.builder(
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, right: 5, left: 5),
              height: 10.h,
              width: 10.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.orange,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.grey, blurRadius: 1, spreadRadius: 1)
                  ]),
              child: Center(
                child: Image.asset('assets/images/clothes.png'),
              ),
            ),
            SizedBox(
              height: 7.sp,
            ),
            Text('C Name')
          ],
        ),
      ),
    );
  }

  Widget mensApparel() {
    return Container(
      margin: EdgeInsets.only(top: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const Text(
            "MEN'S APPAREL",
            style: TextStyle(color: AppColors.pink),
          ),

          const SizedBox(height: 15,),

          Container(
            // margin: EdgeInsets.only(top: 5.sp),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12)
            ),

            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(height: 1.0,),
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('T-Shirt'),
                        Container(
                          height: 20.sp,
                          width: 20.sp,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.navigate_next,size: 20.sp,)),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
  Widget womenApparel() {
    return Container(
      margin: EdgeInsets.only(top: 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const Text(
            "WOMEN APPAREL",
            style: TextStyle(color: AppColors.pink),
          ),

          SizedBox(height: 15,),

          Container(
            // margin: EdgeInsets.only(top: 5.sp),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12)
            ),

            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(height: 1.0,),
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Office-wear'),
                        Container(
                          height: 20.sp,
                          width: 20.sp,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.navigate_next,size: 20.sp,)),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

}
