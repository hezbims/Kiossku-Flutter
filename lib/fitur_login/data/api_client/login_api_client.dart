import 'package:common/constant/url/common_api_url.dart';
import 'package:dependencies/getx/getx.dart';

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
      return post(CommonApiUrl.loginURL , {
        'email' : email,
        'password' : password
      });
  }
}