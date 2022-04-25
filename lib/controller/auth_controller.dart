import 'package:ebazar/controller/services/http_services.dart';
import 'package:ebazar/model/user_model.dart';
import 'package:ebazar/view/screens/auth/login.dart';
import 'package:ebazar/view/screens/home_page/home_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_map/cached_map.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthController extends GetxController {
  RxBool? isLoggedIn = false.obs;
  RxBool loading = false.obs;
  AuthModel? authInfo = AuthModel();
  Rx<User>? user = User().obs;
  SharedPreferences? pref;

  Future<void> onInit() async {
    pref = await SharedPreferences.getInstance();
    isLoggedIn!.value = pref!.getBool('loggedIn')?? false;
    user!.value = (await User.fromCache())!;
    // isLoggedIn.value = user!.value == null ? false : true;
    print(isLoggedIn!.value);
    // TODO: implement onInit
    super.onInit();
  }

  loginUser({String? userName, String? password}) async {
    loading.value = true;
    authInfo = await HttpServices.userLogin(username: userName, password: password);
    print(authInfo);
    loading.value = false;
    if (authInfo!.success == false) {
      // Fluttertoast.showToast(msg: authInfo!.message.toString());
    } else {
      User.saveUserToCache(authInfo!.data!.user!);
      user!.value = authInfo!.data!.user!;

      pref!.setString('userId', user!.value.id.toString());
      pref!.setBool('loggedIn', true);
      isLoggedIn!.value = true;
      Get.off(HomePage());

      // sendToken(user.value.id);
    }
  }

  userSignUp({String? email, String? userName, String? password}) async {
    loading.value = true;
    authInfo = await HttpServices.userSignUp(
        email: email, username: userName, password: password);
    print(authInfo);
    loading.value = false;

    if (authInfo!.success == false) {
      // Fluttertoast.showToast(msg: authInfo!.message.toString());
    } else {
      Fluttertoast.showToast(msg: authInfo!.message.toString());
      User.saveUserToCache(authInfo!.data!.user!);
      user!.value = authInfo!.data!.user!;
      pref!.setBool('loggedIn', true);
      pref!.setString('userId', user!.value.id.toString());
      isLoggedIn!.value = true;
      // sendToken(user.value.id);
      // backtoCartScreen ? Get.off(CartScreen(), transition: Transition.leftToRight) : Get.off(HomePage(), transition: Transition.fadeIn);
    }
  }

  logOut() {
    user!.value = User();
    User.deleteCachedUser();
    isLoggedIn!.value = false;
    Get.off(LoginPage());
    pref!.setBool('loggedIn', false);
  }
}
