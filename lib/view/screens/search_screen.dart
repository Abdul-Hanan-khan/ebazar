import 'package:ebazar/controller/search_product_controller.dart';
import 'package:ebazar/model/search_model.dart';
import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:ebazar/view/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController search = TextEditingController();
  SearchProductController controller = SearchProductController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: AppColors.appBackground,
          appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.pink,
                ),
                onPressed: () {
                  Get.back();
                },
                color: Colors.black,
              ),
              leadingWidth: 30,
              title: Text(
                "Search",
                style: TextStyle(color: AppColors.black),
              )),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 85.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.pink),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60.w,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Product',
                          ),
                          onChanged: (value) {
                            if (value.length == 0)
                              controller.clearSearches();
                            else
                              controller.loadSearchProduct(value);
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.filter_alt_outlined,
                          color: AppColors.pink,
                        ),
                        onPressed: () {
                          // Get.back();
                        },
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                controller.searchedProducts!.value.data == null
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Icon(
                              Icons.search_outlined,
                              size: 60,
                              color: Colors.black38,
                            ),
                            Text(
                              'Looking for anything search here',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            //),
                            // listItem(1),
                          ],
                        ),
                      )
                    : itemsGrid()
              ],
            ),
          )
          ),
    );
  }

  Widget itemsGrid() {
    return Obx(
      () => Container(
        height: 35.h,
        width: double.infinity,
        child: GridView.builder(
          padding: EdgeInsets.all(5),
          itemCount:
              controller.searchedProducts!.value.data!.product!.data!.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 4 / 3.5),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 4,
                    // offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
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
                        '${controller.searchedProducts!.value.data!.product!.data![index].title}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 9, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 18.sp,
                    right: 10.sp,
                    child: Text(
                      '${controller.searchedProducts!.value.data!.product!.data![index].price}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
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
            );
          },
        ),
      ),
    );
  }
}
