import 'package:common/response.dart';
import 'package:kiossku_flutter/fitur_login/data/api_client/login_api_client.dart';
import 'package:kiossku_flutter/fitur_login/domain/repository/ilogin_repository.dart';

class LoginRepository implements ILoginRepository{
  LoginRepository._initial();
  static final _singleton = LoginRepository._initial();
  factory LoginRepository(){
    return _singleton;
  }

  final apiClient = LoginApiClient();

  @override
  Future<ApiResponse> submitData({
    required String email,
    required String password
  }) async {
    final response = await apiClient.submitData(email: email, password: password);

    if (response.isOk){
      return ApiResponseSuccess();
    }
    else{
      return ApiResponseFailed(
          errorMessage: response.bodyString ??
              "Gagal tersambung, periksa koneksi anda!"
      );
    }
  }
}