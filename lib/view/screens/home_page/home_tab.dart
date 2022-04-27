import 'package:ebazar/controller/home_controller.dart';
import 'package:ebazar/model/home_model.dart';
import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:ebazar/view/screens/product/product_details.dart';
import 'package:ebazar/view/screens/search_screen.dart';
import 'package:ebazar/view/screens/see_all_categories.dart';
import 'package:ebazar/view/widgets/image_slider.dart';
import 'package:ebazar/view/widgets/my_button.dart';
import 'package:ebazar/view/widgets/rating_bar.dart';
import 'package:ebazar/view/widgets/topbar_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  HomeController homeInfo = Get.find();

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
        appBar: AppBar(
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: TopBarSearch(),
        ),
        backgroundColor: AppColors.appBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.sp,
              ),

              /// categories
              Obx(
                () => !homeInfo.isLoading.value
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            allCategories(
                                category: homeInfo.homeModel!.data!.category),
                            latestBanner(),
                            itemsGrid(homeInfo.homeModel!.data!.product),
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                        color: AppColors.pink,
                      )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget allCategories({List<Category>? category}) {
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
              height: 10.h,
              width: 90.w,
              // color: Colors.orangeAccent[200],
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: category!.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  // SizedBox(
                  //   height: 5.h,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Center(
                      child: RaisedButton(
                        onPressed: () {
                          homeInfo.getSubCategory(category[index].id);
                          homeInfo.selectedCatId!.value=category[index].id!;
                          Get.to(SeeAllCategories());
                        },
                        color: AppColors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            category[index].title.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
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

  Widget itemsGrid(List<Product>? product) {
    return Container(
      height: 35.h,
      width: double.infinity,
      child: GridView.builder(
        itemCount: product!.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 4 / 3.5),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            hoverColor: AppColors.pink,
            onTap: (){
              Get.to(ProductDetailsPage(product[index].id.toString()));
            },
            child: Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
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
                    child: Container(
                      width: 18.w,
                      child: Text(
                        '${product[index].title}',
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 18.sp,
                    right: 10.sp,
                    child: Text(
                      '${product[index].price}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: AppColors.pink),
                    ),
                  ),
                  Positioned(
                    bottom: 10.sp,
                    right: 10.sp,
                    child: MyRatingBar(
                      itemSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
