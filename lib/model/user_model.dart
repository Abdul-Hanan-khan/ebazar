import 'package:cached_map/cached_map.dart';
class AuthModel {
  bool? success;
  String? message;
  Data? data;

  AuthModel({this.success, this.message, this.data});

  AuthModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['token'] = token;
    if (user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  int? storeId;
  int? providerId;
  String? role;
  int? roleId;
  String? name;
  String? email;
  String? username;
  String? photo;
  String? city;
  String? building;
  String? area;
  String? postcode;
  String? address1;
  String? address2;
  String? emailVerifiedAt;
  String? provider;
  String? status;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.storeId,
        this.providerId,
        this.role,
        this.roleId,
        this.name,
        this.email,
        this.username,
        this.photo,
        this.city,
        this.building,
        this.area,
        this.postcode,
        this.address1,
        this.address2,
        this.emailVerifiedAt,
        this.provider,
        this.status,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id']??000000000;
    providerId = json['provider_id'] ?? 000000000;
    role = json['role'] ?? "";
    roleId = json['role_id']??000000000;
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    username = json['username'] ?? "";
    photo = json['photo'] ?? "";
    city = json['city'] ?? "";
    building = json['building'] ?? "";
    area = json['area'] ?? "";
    postcode = json['postcode']??"";
    address1 = json['address1'] ?? "";
    address2 = json['address2'] ?? "";
    emailVerifiedAt = json['email_verified_at'] ?? "";
    provider = json['provider'] ?? "";
    status = json['status'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['store_id'] = storeId;
    data['provider_id'] = providerId;
    data['role'] = role;
    data['role_id'] = roleId;
    data['name'] = name;
    data['email'] = email;
    data['username'] = username;
    data['photo'] = photo;
    data['city'] = city;
    data['building'] = building;
    data['area'] = area;
    data['postcode'] = postcode;
    data['address1'] = address1;
    data['address2'] = address2;
    data['email_verified_at'] = emailVerifiedAt;
    data['provider'] = provider;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }





  ///custom functions
  static Future<User?> fromCache() async{
    Mapped cacheJson = await Mapped.getInstance();
    var cachedUser = cacheJson.loadFile(cachedFileName: "user");
    print("user from cache: $cachedUser");
    if(cachedUser==null)
      return null;
    else
      return User.fromJson(cachedUser);
  }

  /// member functions

  static Future<String> saveUserToCache(User user) async{
    Mapped cacheJson = await Mapped.getInstance();
    try{
      cacheJson.saveFile(file: user.toJson(), cachedFileName: "user");
    }
    catch(e){
      return "Failed to save user due to: $e";
    }
    return "Save user to cache successfully ";
  }



  static Future<String> deleteCachedUser()async{
    Mapped cacheJson = await Mapped.getInstance();
    try{
      cacheJson.deleteFile(cachedFileName: "user");
    }
    catch(e){
      return "Some Problem accoured while deleting user File:$e";
    }
    return "Deleted user to cache successfully";

  }

}
