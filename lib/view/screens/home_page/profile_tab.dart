import 'package:ebazar/controller/auth_controller.dart';
import 'package:ebazar/view/widgets/AlertDialogeWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileTab extends StatelessWidget {
  AuthController authController=Get.find();
  ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
        leading: IconButton(
          icon: Icon(Icons.power_settings_new),onPressed: (){
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context)
              {
                return AlertDialogWidget(title: 'Warning',subTitle: "Are you sure to log out",onPositiveClick: ()=>authController.logOut(),);
              }
          );
            // authController.logOut();
        },
        ),
      ),
      body: Center(child: Text('profile Tab'),),
    );
  }
}
