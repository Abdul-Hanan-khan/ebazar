import 'package:ebazar/controller/bottom_bar_controller.dart';
import 'package:ebazar/view/screens/getting_started.dart';
import 'package:ebazar/view/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var bottomBarController=Get.put(BottomBarController());
    
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
          home:  ResponsiveSizer(
            builder: (context, orientation, screenType) {
          return const GettingStarted();
        },
    ),
        );
      

  }
}

