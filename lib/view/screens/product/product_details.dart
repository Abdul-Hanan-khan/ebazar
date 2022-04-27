import 'package:ebazar/controller/product_details_controller.dart';
import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:ebazar/view/widgets/my_button.dart';
import 'package:ebazar/view/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsPage extends StatefulWidget {
  String productId;

  ProductDetailsPage(this.productId, {Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  var prodController = ProductDetailsController();

  @override
  void initState() {
    prodController.getProductDetails(widget.productId);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Obx(
          () => !prodController.isLoading!.value
              ? SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 20.sp),
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
                                Icons.shopping_cart_outlined,
                                color: AppColors.grey,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Container(
                          // margin: EdgeInsets.all(20),
                          width: 50.w,
                          height: 50.w,
                          // padding: EdgeInsets.all(20),
                          child: Image.network(
                              'https://i.gadgets360cdn.com/products/large/71IHMdlbg5L.-SX679-679x679-1648707972.jpg?downsize=*:360'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${prodController.prodDetails.value.data!.product!.title}',
                              style: TextStyle(fontSize: 22),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: AppColors.pink,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${prodController.prodDetails.value.data!.product!.price}',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.grey),
                            ),
                            Text(
                              '\$800',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.pink),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rating',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.grey),
                            ),
                            MyRatingBar(
                              itemCount: 5,
                              initialRating: 3,
                              itemSize: 15,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              color: Colors.white,
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("Product"),
                              onPressed: () {
                                prodController.selectedSection.value =
                                    "Product";
                              },
                            ),
                            RaisedButton(
                              color: Colors.white,
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text("Details"),
                              onPressed: () {
                                prodController.selectedSection.value =
                                    "Details";
                              },
                            ),
                            RaisedButton(
                              color: Colors.white,
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("Reviews"),
                              onPressed: () {
                                prodController.selectedSection.value =
                                    "Reviews";
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 30.h,
                          width: 90.w,
                          child:
                              prodController.selectedSection.value == "Product"
                                  ? productSection()
                                  : prodController.selectedSection.value ==
                                          "Details"
                                      ? detailsSection()
                                      : reviewsSection(),
                        )
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: AppColors.pink,
                  ),
                ),
        ),
        floatingActionButton: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          width: 90.w,
          height: 7.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40.w,
                height: 7.h,
                child: RaisedButton(
                  onPressed: () {},
                  color: AppColors.white,
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SHARE THIS",
                        style: TextStyle(fontSize: 10),
                      ),
                      Container(
                        height: 26.sp,
                        width: 26.sp,
                        decoration: BoxDecoration(
                            color: AppColors.grey[300],
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Icon(
                            Icons.arrow_upward,
                            color: AppColors.pink,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  width: 45.w,
                  height: 7.h,
                  child: MyButton(
                    buttonText: 'ADD TO CART',
                    onPressed: () {},
                    fontSize: 11,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget productSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SELECT SIZE   (US)",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                "CHART SIZE",
                style: TextStyle(fontSize: 12, color: AppColors.pink),
              ),
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            width: 80.w,
            height: 10.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount:
                  prodController.prodDetails.value.data!.product!.size!.length,
              itemBuilder: (BuildContext context, int index) {
                prodController.selectedSizeId!.value = prodController
                    .prodDetails.value.data!.product!.size![0].id!;
                print(prodController
                    .prodDetails.value.data!.product!.size![0].id);
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  // SizedBox(
                  //   height: 5.h,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Center(
                      child: Obx(
                        () => SizedBox(
                          height: 24.sp,
                          width: 40.sp,
                          child: RaisedButton(
                            elevation: prodController.selectedSizeId!.value ==
                                    prodController.prodDetails.value.data!
                                        .product!.size![index].id
                                ? 7
                                : 0,
                            onPressed: () {
                              prodController.selectedSizeId!.value =
                                  prodController.prodDetails.value.data!
                                      .product!.size![index].id!;
                            },
                            color: prodController.selectedSizeId!.value ==
                                    prodController.prodDetails.value.data!
                                        .product!.size![index].id!
                                ? AppColors.pink
                                : AppColors.grey[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                prodController.prodDetails.value.data!.product!
                                    .size![index].colorName
                                    .toString(),
                                style: TextStyle(
                                    color:
                                        prodController.selectedSizeId!.value ==
                                                prodController
                                                    .prodDetails
                                                    .value
                                                    .data!
                                                    .product!
                                                    .size![index]
                                                    .id!
                                            ? Colors.white
                                            : Colors.black,
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "SELECT COLOR",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Container(
            width: 80.w,
            height: 10.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: prodController
                  .prodDetails.value.data!.product!.choice!.length,
              itemBuilder: (BuildContext context, int index) {
                prodController.selectedChoiceId!.value = prodController
                    .prodDetails.value.data!.product!.choice![2].id!;
                print(prodController
                    .prodDetails.value.data!.product!.choice![0].id);
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  // SizedBox(
                  //   height: 5.h,
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Center(
                      child: Obx(
                        () => SizedBox(
                          height: 24.sp,
                          width: 40.sp,
                          child: RaisedButton(
                            elevation: prodController.selectedChoiceId!.value ==
                                    prodController.prodDetails.value.data!
                                        .product!.choice![index].id
                                ? 7
                                : 0,
                            onPressed: () {
                              prodController.selectedChoiceId!.value =
                                  prodController.prodDetails.value.data!
                                      .product!.choice![index].id!;
                            },
                            color: prodController.selectedChoiceId!.value ==
                                    prodController.prodDetails.value.data!
                                        .product!.choice![index].id!
                                ? AppColors.pink
                                : AppColors.grey[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                prodController.prodDetails.value.data!.product!
                                    .choice![index].colorName
                                    .toString(),
                                style: TextStyle(
                                    color: prodController
                                                .selectedChoiceId!.value ==
                                            prodController
                                                .prodDetails
                                                .value
                                                .data!
                                                .product!
                                                .choice![index]
                                                .id!
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget detailsSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
      children: [
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Brand",style: TextStyle(color: AppColors.grey,fontSize: 14),),
                  Text("SKU",style: TextStyle(color: AppColors.grey,fontSize: 14),)
                ],
              ),     Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Engine",style: TextStyle(color: AppColors.black,fontSize: 16),),
                  Text("01354821211",style: TextStyle(color: AppColors.black,fontSize: 16),)
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.sp,),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Brand",style: TextStyle(color: AppColors.grey,fontSize: 14),),
                  Text("Brand",style: TextStyle(color: AppColors.grey,fontSize: 14),)
                ],
              ),     Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Condition",style: TextStyle(color: AppColors.black,fontSize: 16),),
                  Text("Material",style: TextStyle(color: AppColors.black,fontSize: 16),)
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.sp,),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Category",style: TextStyle(color: AppColors.grey,fontSize: 14),),
                  Text("Fitting",style: TextStyle(color: AppColors.grey,fontSize: 14),)
                ],
              ),     Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Women Scarf",style: TextStyle(color: AppColors.black,fontSize: 16),),
                  Text("True to size",style: TextStyle(color: AppColors.black,fontSize: 16),)
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.sp,),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Soled By",style: TextStyle(color: AppColors.grey,fontSize: 14),),

                ],
              ),     Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sabahat Hussain Qureishi",style: TextStyle(color: AppColors.black,fontSize: 16),),

                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget reviewsSection() {
    return Container(
      child: Text("reviews"),
    );
  }
}
