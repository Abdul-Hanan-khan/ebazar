import 'package:ebazar/view/app_config/app_colors.dart';
import 'package:ebazar/view/screens/auth/sign_up.dart';
import 'package:ebazar/view/widgets/appBar.dart';
import 'package:ebazar/view/widgets/error_dialog.dart';
import 'package:ebazar/view/widgets/my_button.dart';
import 'package:ebazar/view/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
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
                        'Forgot Password',
                        style: TextStyle(
                            color: AppColors.blueAccent, fontSize: 21.sp),
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Text(
                      'Enter the email address you used to create your account and we will email you a link to reset your password',
                      style: TextStyle(color: AppColors.grey),
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
              ),
              Container(
                height: 20.h,
                child: MyTextField(
                  controller: emailCtr,
                  label: 'Email',
                  disableborder: true,
                ),
              ),
              Container(
                height: 30.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width,
                    ),
                    SizedBox(
                      width: 50.w,
                      child: MyButton(
                        onPressed: () {
                          if (sendEmailValidation(context)) {
                            // go to home
                          }
                        },
                        buttonText: "Send Email",
                      ),
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

  bool sendEmailValidation(BuildContext context) {
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
    } else
      return true;
  }
}
