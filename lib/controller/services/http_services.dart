import 'dart:convert';
import 'package:ebazar/model/home_model.dart';
import 'package:ebazar/model/product_details_model.dart';
import 'package:ebazar/model/search_model.dart';
import 'package:ebazar/view/app_config/app_apis.dart';
import 'package:ebazar/view/screens/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ebazar/model/user_model.dart';
import 'package:get/get.dart';

class HttpServices {
  static Future<AuthModel?> userLogin(
      {String? username, String? password}) async {
    try {
      var response = await http.post(
        Uri.parse(AppApis.BASE_URL + AppApis.USER_LOGIN),
        body: {'username': username, 'password': password},
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

  static Future<AuthModel?> userSignUp(
      {String? email, String? username, String? password}) async {
    try {
      var response = await http.post(
        Uri.parse(AppApis.BASE_URL + AppApis.USER_SIGNUP),
        body: {'email': email, 'username': username, 'password': password},
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

  static Future<HomeModel?> home() async {
    try {
      var response = await http.get(
        Uri.parse(AppApis.BASE_URL + AppApis.HOME_API),
      );
      if (response.statusCode == 200) {
        return HomeModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<SearchModel?> searchProduct({
    String? page,
    String? searchString,
    String? catId,
    String? choiceId,
    String? sizeId,
    String? priceStartingRange,
    String? priceEndRange,
  }) async {
    try {
      String url =
          'http://dev.e-bazaaronline.com/api/home/search?page=${page ?? "1"}&search=${searchString ?? ""}&category_id=${catId ?? ""}&choice_id=${choiceId ?? ""}&size_id=${sizeId ?? ""}&price_range=${priceStartingRange ?? "0"}-${priceEndRange ?? "100000"}';
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        // List rawList = jsonDecode(response.body)['products'];
        return SearchModel.fromJson(jsonDecode(response.body));
      } else
        return null;
    } catch (e) {
      return null;
    }
  }

  static Future<ProductDetailModel?> getProductDetails(@required String productId) async {
    try {
      String url=AppApis.BASE_URL+"home/detail?product_id=${productId}";
      print(url);
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return ProductDetailModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
