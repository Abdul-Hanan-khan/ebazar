import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:ebazar/view/screens/order_screens/current_order.dart';
import 'package:ebazar/view/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  RxInt dummyCount = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.pink,
                )),
            Text(
              "Checkout",
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
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
            child: ListView(
              padding: EdgeInsets.only(bottom: 10.h),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.w,
                    ),
                    const Text(
                      'SHIPPING ADDRESS',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Container(
                      width: 45.w,

                      // height: 200,
                      child: const Text(
                          'Abdul Hanan , 03349464953 ,G-15 Markaz, Islamabad, Punjab 46000 '),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    const Text(
                      'PAYMENT METHOD',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.sell_outlined,
                                color: AppColors.pink,
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              const Text(
                                "Cash On Delivery",
                                style: TextStyle(color: AppColors.pink),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.to(SeeAllCategories());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5, left: 5),
                                height: 2.h,
                                width: 2.h,
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
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.pink,
                                  size: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    const Text(
                      'ITEMS',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    renderCartItem(),
                    renderCartItem(),

                    SizedBox(
                      height: 20.sp,
                    ),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Message for Seller  (Optional)',style: TextStyle(color: AppColors.grey),),
                      ],
                    ),

                    SizedBox(
                      height: 15.sp,
                    ),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),


                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.sell_outlined,
                                color: AppColors.pink,
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              const Text(
                                "Have a Promo ?",
                                style: TextStyle(color: AppColors.pink),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.to(SeeAllCategories());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5, left: 5),
                                height: 2.h,
                                width: 2.h,
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
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: AppColors.pink,
                                  size: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),



                    SizedBox(
                      height: 10.sp,
                    ),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
          renderBottomSection(),
        ],
      ),
    ));
  }

  Widget renderBottomSection() {
    return Positioned(
      bottom: 15.sp,
      child: Container(
        width: 100.w,
        color: Colors.white,
        padding: EdgeInsets.only(left: 15.sp,right: 15.sp,top: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TOTAL',
                  style: TextStyle(color: AppColors.black, fontSize: 17.sp),
                ),
                Text(
                  '\$ 800',
                  style: TextStyle(color: AppColors.pink, fontSize: 20.sp),
                ),
                Text(
                  'Free Shipping',
                  style: TextStyle(color: AppColors.black, fontSize: 17.sp),
                )
              ],
            ),
            MyButton(
                buttonText: 'Place Order',
                onPressed: () {
                  Get.to(CurrentOrder());
                })
          ],
        ),
      ),
    );
  }

  Widget renderCartItem() {
    return Container(
      height: 12.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 15.sp),

      // color: AppColors.pink,
      child: Row(
        children: [
          Container(
            height: 10.h,
            width: 10.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/Polygon18.png',
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/headphones.png',
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 20.sp,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Headphones',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Color',
                      style: TextStyle(color: AppColors.grey),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Purple',
                      style: TextStyle(color: AppColors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Size',
                      style: TextStyle(color: AppColors.grey),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Regular',
                      style: TextStyle(color: AppColors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$ 800",
                      style: TextStyle(color: AppColors.pink),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 3.1.h,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (dummyCount.value != 0) {
                                        dummyCount.value--;
                                      }

                                      // cartController.removeItem(products, index);
                                      // if(products.quantity.value>0){
                                      //   products.quantity.value--;
                                      //   // cartController.totalPrice.value= cartController.totalPrice.value-int.parse(products.salePrice);
                                      // };
                                    },
                                    child: Container(
                                      height: 2.5.h,
                                      width: 2.5.h,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.white),
                                      child: const Icon(
                                        Icons.remove,
                                        size: 14,
                                        color: AppColors.pink,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Obx(() => Text(dummyCount.value.toString())),
                                  // Text("${products.quantity.value}", style: const TextStyle(fontSize: 12, color: Colors.white), ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      dummyCount.value++;
                                      // cartController.addItem(products, index, products.quantity.value);
                                    },
                                    child: Container(
                                      height: 2.5.h,
                                      width: 2.5.h,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.white),
                                      child: const Icon(
                                        Icons.add,
                                        size: 14,
                                        color: AppColors.pink,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
