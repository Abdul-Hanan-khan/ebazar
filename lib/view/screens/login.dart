import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:ebazar/view/screens/forgot_password.dart';
import 'package:ebazar/view/screens/home_page/home_page.dart';
import 'package:ebazar/view/screens/sign_up.dart';
import 'package:ebazar/view/widgets/appBar.dart';
import 'package:ebazar/view/widgets/error_dialog.dart';
import 'package:ebazar/view/widgets/my_button.dart';
import 'package:ebazar/view/widgets/my_text_field.dart';
import 'package:ebazar/view/widgets/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var emailCtr = TextEditingController();
  var passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleAppBar(title: ''),
              Container(
                height: 30.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Welcome Login',
                        style: TextStyle(
                            color: AppColors.blueAccent, fontSize: 21.sp),
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 40.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  spreadRadius: 3),
                            ],
                          ),
                          child: Center(
                            child: Image.asset('assets/icons/facebook.png'),
                          ),
                        ),
                        Container(
                          width: 40.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3,
                                  spreadRadius: 3),
                            ],
                          ),
                          child: Center(
                            child: Image.asset('assets/icons/google.png'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 28.h,
                child: Column(
                  children: [
                    MyTextField(
                      controller: emailCtr,
                      label: 'Username',
                      disableborder: true,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    MyTextField(
                      controller: passwordCtr,
                      label: 'Password',
                      disableborder: true,
                    ),
                    SizedBox(
                      height: 0.9.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          Get.to(ForgotPassword());
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(color: AppColors.pink),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
              ),
              Container(

                child: Column(
                  children: [
                    SizedBox(
                      width: Get.width,
                    ),
                    SizedBox(
                      width: 50.w,
                      child: MyButton(
                        onPressed: () {
                          Get.to(HomePage());
                          // Get.to( MyRatingBar(itemCount: 5,));
                          // if (signInValidation(context)) {
                          //   // go to home
                          // }
                        },
                        buttonText: "Login",
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        FlatButton(
                          onPressed: () {
                            Get.off(SignUp());
                          },
                          child: const Text(
                            'Create Now',
                            style: TextStyle(color: AppColors.pink),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  bool signInValidation(BuildContext context) {
    if (emailCtr.text.trim().length == 0) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Email must be entered to proceed.",
            );
          });
      return false;
    } else if (!GetUtils.isEmail(emailCtr.text)) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "In-Valid email",
            );
          });
      return false;
    } else if (passwordCtr.text.trim().length == 0) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return ErrorDialoge(
              message: "Password must be entered to proceed.",
            );
          });
      return false;
    } else
      return true;
  }
}
