import 'package:ebazar/controller/home_controller.dart';
import 'package:ebazar/model/home_model.dart';
import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SeeAllCategories extends StatelessWidget {

  HomeController homeInfo=Get.find();



  SeeAllCategories( {Key? key}) : super(key: key);

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
                  allCategoriesList(category: homeInfo.homeModel!.data!.category),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    width: 65.w,
                    height: 86.h,
                    child: ListView(
                      children: [
                        mensApparel(),
                        // womenApparel(),
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

  Widget allCategoriesList({List<Category>? category}) {
    return Container(
      width: 30.w,
      height: 86.h,
      child: ListView.builder(
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        itemCount: category!.length,
        itemBuilder: (BuildContext context, int index) =>Container(
          margin: EdgeInsets.only(top: 10),
          // SizedBox(
          //   height: 5.h,
          child: Padding(
            padding: EdgeInsets.only(right: 5),
            child: Center(
              child: Obx(
                ()=> RaisedButton(
                  elevation:homeInfo.selectedCatId!.value == category[index].id?7:0 ,
                  onPressed: () {
                    homeInfo.getSubCategory(category[index].id);
                    homeInfo.selectedCatId!.value=category[index].id!;
                  },
                  color: homeInfo.selectedCatId!.value == category[index].id? AppColors.pink:AppColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      category[index].title.toString(),
                      style: TextStyle(color:  homeInfo.selectedCatId!.value == category[index].id?Colors.white: Colors.black,fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
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

          Obx(
              ()=> Container(
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
                itemCount: homeInfo.subCategory!.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text('${homeInfo.subCategory![index].title}'),
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
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
  // Widget womenApparel() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 15.sp),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       // physics: const AlwaysScrollableScrollPhysics(),
  //       children: [
  //         const Text(
  //           "WOMEN APPAREL",
  //           style: TextStyle(color: AppColors.pink),
  //         ),
  //
  //         SizedBox(height: 15,),
  //
  //         Container(
  //           // margin: EdgeInsets.only(top: 5.sp),
  //           decoration: BoxDecoration(
  //             color: AppColors.white,
  //             borderRadius: BorderRadius.circular(12)
  //           ),
  //
  //           child: ListView.separated(
  //             physics: const NeverScrollableScrollPhysics(),
  //             separatorBuilder: (context, index) => const Divider(height: 1.0,),
  //             shrinkWrap: true,
  //             // scrollDirection: Axis.horizontal,
  //             itemCount: 10,
  //             itemBuilder: (BuildContext context, int index) => Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //
  //                 Padding(
  //                   padding: const EdgeInsets.all(12.0),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text('Office-wear'),
  //                       Container(
  //                         height: 20.sp,
  //                         width: 20.sp,
  //                         decoration: BoxDecoration(
  //                           color: Colors.grey[300],
  //                           borderRadius: BorderRadius.circular(30)
  //                         ),
  //                         child: Align(
  //                             alignment: Alignment.center,
  //                             child: Icon(Icons.navigate_next,size: 20.sp,)),
  //                       )
  //
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //
  //       ],
  //     ),
  //   );
  // }

}
