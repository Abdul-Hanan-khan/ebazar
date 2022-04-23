import 'package:ebazar/controller/services/http_services.dart';
import 'package:ebazar/model/login_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool loading = false.obs;
  AuthModel? authInfo=AuthModel();

  loginUser({String? userName, String? password}) async {
    loading.value = true;
    authInfo =  await HttpServices.userLogin(username: userName, password: password);
    print(authInfo);
    loading.value = false;

  }
  userSignUp({String? email,String? userName, String? password}) async {
    loading.value = true;
    authInfo =  await HttpServices.userSignUp(email: email,username: userName, password: password);
    print(authInfo);
    loading.value = false;
  }
}
