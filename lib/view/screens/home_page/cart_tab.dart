import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:ebazar/view/screens/order_screens/checkout.dart';
import 'package:ebazar/view/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class CartTab extends StatelessWidget {
  CartTab({Key? key}) : super(key: key);
  RxInt dummyCount = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            title: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Cart",
                style: TextStyle(color: AppColors.black),
              ),
            ),
            actions: [appbarActions()],
          ),
          body: Stack(
            children: [
              Container(
                child: ListView(
                  children: [
                     Padding(
                       padding:  EdgeInsets.only(bottom: 12.h),
                       child: Column(
                        children: [
                          renderCartItem(),
                          renderCartItem(),

                        ],
                    ),
                     ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0.sp,
                child: Container(
                  width: 100.w,

                  color: AppColors.white,
                  padding: EdgeInsets.only(left: 15.sp,right: 15.sp,top: 5.sp),
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
                            style: TextStyle(
                                color: AppColors.black, fontSize: 17.sp),
                          ),
                          Text(
                            '\$ 800',
                            style: TextStyle(
                                color: AppColors.pink, fontSize: 20.sp),
                          ),
                          Text(
                            'Free Shipping',
                            style: TextStyle(
                                color: AppColors.black, fontSize: 17.sp),
                          )
                        ],
                      ),
                      MyButton(
                          buttonText: 'CHECKOUT',
                          onPressed: () {
                            Get.to(CheckoutScreen());
                          })
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget appbarActions() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Row(
        children: [
          Container(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Image.asset(
                  'assets/icons/Messages.png',
                  height: 22.sp,
                  width: 22.sp,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: 15.sp,
                  right: 15.sp,
                  child: Container(
                    width: 18.sp,
                    height: 18.sp,
                    decoration: BoxDecoration(
                        color: AppColors.pink,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 15.sp,
          ),
          Container(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Image.asset(
                  'assets/icons/notifications.png',
                  height: 22.sp,
                  width: 22.sp,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: 15.sp,
                  right: 15.sp,
                  child: Container(
                    width: 18.sp,
                    height: 18.sp,
                    decoration: BoxDecoration(
                        color: AppColors.pink,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget renderCartItem() {
    return Container(
      height: 22.h,
      width: 100.w,

      padding: EdgeInsets.symmetric(horizontal: 15.sp),

      // color: AppColors.pink,
      child: Row(
        children: [
          Container(
            height: 17.h,
            width: 17.h,
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
                            height: 5.h,
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
                                      height: 3.5.h,
                                      width: 3.5.h,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: const Offset(0, 3) // changes position of shadow
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
                                      height: 3.5.h,
                                      width: 3.5.h,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0, 3), // changes position of shadow
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
