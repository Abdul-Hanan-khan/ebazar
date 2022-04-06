import 'package:ebazar/view/app_colors/app_colors.dart';
import 'package:ebazar/view/widgets/image_slider.dart';
import 'package:ebazar/view/widgets/topbar_search.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
   HomeTab({Key? key}) : super(key: key);

  List<String> images=['assets/banners/Banner2.png','assets/banners/Base.png'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget allCategories(){
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Categories',
            style: TextStyle(
                fontSize: 21.sp, fontWeight: FontWeight.bold),
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
                itemBuilder: (BuildContext context, int index) =>
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5,left: 5),
                          height: 10.h,
                          width: 10.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.orange,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grey,
                                    blurRadius: 1,
                                    spreadRadius: 1
                                )
                              ]
                          ),
                          child: Center(
                            child: Image.asset('assets/images/clothes.png'),
                          ),
                        ),
                        SizedBox(height: 7.sp,),
                        Text('C Name')
                      ],
                    ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5,left: 5),
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
                      ]
                  ),
                  child: Center(child: IconButton(onPressed: () {  },iconSize: 25.sp, icon: Icon(Icons.arrow_forward_ios,color: AppColors.pink,),),),
                ),
                SizedBox(height: 7.sp,),
                Text('See All')
              ],
            ),
          ],
        ),
      ],
    );
  }
  Widget latestBanner(){
    List sliderImages=['assets/banners/Banner2.png','assets/banners/Base.png'];
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Latest',
            style: TextStyle(
                fontSize: 21.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          height: 300,
          width: double.infinity,
          child: Carousel(
            dotSize: 5,
            dotSpacing: 10,
            autoplay: false,
            dotColor: Colors.white,
            dotIncreasedColor: Colors.pink,
            indicatorBgPadding: 5,
            dotBgColor: Colors.transparent,
            dotVerticalPadding: 5,
            images:<Widget> [
              for(var i=0;i<images.length;i++)
                 Container(
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage(images[i])
                     )
                   ),
                 )
            ]
          ),
        ),

      ],
    );
  }
}
