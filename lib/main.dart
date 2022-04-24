import 'package:ebazar/controller/auth_controller.dart';
import 'package:ebazar/controller/bottom_bar_controller.dart';
import 'package:ebazar/view/screens/getting_started.dart';
import 'package:ebazar/view/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  runApp( MyApp());
 getLoginInfo();
}
SharedPreferences? pref;
getLoginInfo()async{

  pref =await SharedPreferences.getInstance();
  isLoggedIN= ( pref!.getBool('loggedIn'))!;
  print("use login status $isLoggedIN");
}
bool isLoggedIN=false;
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    // TODO: implement initState
    // getLoginInfo();
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    var bottomBarController=Get.put(BottomBarController());
    var authController=Get.put(AuthController());

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
          home:  ResponsiveSizer(
            builder: (context, orientation, screenType) {
          return isLoggedIN?HomePage(): GettingStarted();
        },
    ),
        );


  }
}

