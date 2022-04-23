import 'dart:convert';
import 'package:ebazar/view/app_config/app_apis.dart';
import 'package:http/http.dart' as http;
import 'package:ebazar/model/login_model.dart';
import 'package:get/get.dart';

class HttpServices{

  static Future<AuthModel?> userLogin(
      {String ? username, String ? password}) async {
    try {
      var response = await http.post(
        Uri.parse(AppApis.BASE_URL+AppApis.USER_LOGIN),
        body: {

          'username': username,
          'password': password
        },
      );
      if (response.statusCode == 200) {
        return AuthModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  static Future<AuthModel?> userSignUp({String ? email,String ? username, String ? password}) async {
    try {
      var response = await http.post(
        Uri.parse(AppApis.BASE_URL+AppApis.userSignup),
        body: {

          'email': email,
          'username': username,
          'password': password
        },
      );
      if (response.statusCode == 200) {
        return AuthModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}