import 'package:ebazar/view/screens/auth/login.dart';
import 'package:ebazar/view/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class GettingStarted extends StatelessWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/RepeatGrid8.png'),fit: BoxFit.cover
                )
            ),
          ),
          Positioned(
              top: 50,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lets Create Your',style: TextStyle(fontSize: 20.sp),),
                    const SizedBox(height: 20,),
                    Text('Own Style',style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color: Colors.black),),
                    const SizedBox(height: 30,),
                    MyButton(buttonText: 'Get Started', onPressed: (){
                      Get.to( LoginPage());
                    }),
                  ],
                ),
              )),
        ],
      )
    );
  }
}
