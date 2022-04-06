
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ebazar/controller/bottom_bar_controller.dart';
import 'package:ebazar/view/screens/home_page/cart_tab.dart';
import 'package:ebazar/view/screens/home_page/favourite_tab.dart';
import 'package:ebazar/view/screens/home_page/home_tab.dart';
import 'package:ebazar/view/screens/home_page/more_tab.dart';
import 'package:ebazar/view/screens/home_page/profile_tab.dart';
import 'package:ebazar/view/widgets/bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {

  // AuthController authController = Get.put(AuthController());
  // final productScreenController = Get.put(ProductScreenController());
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i=1;
  RxBool progressing = false.obs;
  BottomBarController bottomBarController=Get.find();


  final List _tabs = [
    HomeTab(),
    FavouriteTab(),
    CartTab(),
    ProfileTab(),
    MoreTab(),

  ];
  @override
  void initState() {
    // _checkUpdates();
    // checkRealtimeConnection();
    super.initState();
  }


  ///checking updates using API \\\

  // _checkUpdates() async {
  //
  //   var latestVersion;
  //   int appVersion = await _getVersion();
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   latestVersion = pref.getString("latestVersion");
  //   // if(latestVersion!=null)
  //   // {
  //   //   latestVersion = latestVersion.split(".")[0]+latestVersion.split(".")[1]+latestVersion.split(".")[2];
  //   // }
  //   print("latest pref version: $latestVersion");
  //   var response;
  //   try{
  //     response = await HttpHelper.post(body: {
  //       "app_update" : '1',
  //     });
  //     latestVersion = Platform.isAndroid ? jsonDecode(response.body)["android_update"] : jsonDecode(response.body)["ios_update"];
  //     latestVersion= latestVersion.split(".");
  //     latestVersion = (latestVersion[0]+latestVersion[1]+latestVersion[2]);
  //     progressing.value = false;
  //     if (latestVersion != null && appVersion != null && int.parse(latestVersion) > appVersion) {
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> UpdatePromptScreen()));
  //       print("Calling Upgrade Prompt Screen ${i++}");
  //     }// todo change the bool statement to >
  //
  //     print("latest version: $latestVersion");
  //     pref.setString("latestVersion", latestVersion);
  //   }
  //   catch(e){}
  //
  // }


  ///getting current version of the App
  // Future<int> _getVersion() async {
  //   int version;
  //   List versions;
  //   final packageInfo = await PackageInfo.fromPlatform();
  //   print("Current version:"+packageInfo.version);
  //   versions= packageInfo.version.split(".");
  //   return int.parse(versions[0]+versions[1]+versions[2]);
  // }

  @override
  Widget build(BuildContext context) {
    // FCM.configureFCM();
    // getToken();
    return Scaffold(
//      appBar: MyAppBarWidgets().getMyAppBar(),
      body:Obx(
              () => progressing.value
              ? const Center(child: CircularProgressIndicator(),)
              : _tabs[bottomBarController.currentBNBIndex.value]
      ),
      bottomNavigationBar: BottomNavigateBar(),
    );
  }
}