import 'package:get/get.dart';
import 'package:kiossku_flutter/common/constant/url/api_url.dart';

class LoginApiClient extends GetConnect{
  static final LoginApiClient _singleton = LoginApiClient._internal();
  factory LoginApiClient() {
    return _singleton;
  }
  LoginApiClient._internal();

  Future<Response> submitData({
    required String email,
    required String password
  }){
      return post(ApiUrl.loginURL , {
        'email' : email,
        'password' : password
      });
  }
}