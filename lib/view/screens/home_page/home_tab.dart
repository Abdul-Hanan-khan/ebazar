import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:ebazar/view/screens/see_all_categories.dart';
import 'package:ebazar/view/widgets/image_slider.dart';
import 'package:ebazar/view/widgets/rating_bar.dart';
import 'package:ebazar/view/widgets/topbar_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);
  List<String> sliderImages = [
    'assets/banners/Banner2.png',
    'assets/banners/Base.png'
  ];

  // List<String> images=['assets/banners/Banner2.png','assets/banners/Base.png'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopBarSearch(),

              /// categories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    allCategories(),
                    latestBanner(),
                    itemsGrid(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget allCategories() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Row(
          children: [
            Container(
              height: 15.h,
              width: 69.w,
              // color: Colors.orangeAccent[200],
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5, left: 5),
                      height: 10.h,
                      width: 10.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.orange,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.grey,
                                blurRadius: 1,
                                spreadRadius: 1)
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
            ),
            GestureDetector(
              onTap: (){
                Get.to(SeeAllCategories());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5, left: 5),
                    height: 10.h,
                    width: 10.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 3.0,
                          )
                        ]),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Get.to(SeeAllCategories());
                        },
                        iconSize: 25.sp,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.pink,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.sp,
                  ),
                  Text('See All')
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget latestBanner() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Latest',
            style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.bold),
          ),
        ),
        // SizedBox(
        //   height: 10.sp,
        // ),
        ImageSlider(sliderImages),
      ],
    );
  }

  Widget itemsGrid() {
    return Container(
      height: 35.h,
      width: double.infinity,
      child: GridView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 4 / 3.5),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                const Positioned(
                    right: 5,
                    top: 5,
                    child: Icon(
                      Icons.favorite_outlined,
                      color: AppColors.pink,
                    )),
                Positioned(
                  top: 15.sp,
                  left: 18.sp,
                  child: Image.asset('assets/images/backpack.png'),
                ),
                Positioned(
                  bottom: 18.sp,
                  left: 10.sp,
                  child: Text(
                    'Backpack',
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 18.sp,
                  right: 10.sp,
                  child: Text(
                    'Rs: 100',
                    style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: AppColors.pink),
                  ),
                ),
                Positioned(
                  bottom: 10.sp,
                  right: 10.sp,
                  child: MyRatingBar(itemSize: 10,),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
