import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_login/domain/repository/ilogin_repository.dart';
import 'package:kiossku_flutter/navigation/nav_route.dart';

class LoginController extends GetxController{
  final ILoginRepository repository;
  LoginController({required this.repository});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _uiState = LoginPageUIState().obs;
  LoginPageUIState get uiState => _uiState.value;

  bool get isLoginLoading => uiState.loginApiResponse is ApiResponseLoading;

  void submit(){
    if (uiState.loginApiResponse is! ApiResponseLoading){
      _uiState.update(
        (val) => _uiState.value.loginApiResponse = ApiResponseLoading()
      );

      repository.submitData(
          email: emailController.text,
          password: passwordController.text
      ).then((ApiResponse apiResponse) {
        _uiState.update((val) =>
          _uiState.value.loginApiResponse = apiResponse
        );

        if (apiResponse is ApiResponseSuccess) {
          Get.toNamed(NavRoute.homeRoute);
        }
        else if (apiResponse is ApiResponseFailed){
          Fluttertoast.showToast(
            msg: apiResponse.errorMessage ?? "Unknown Error"
          );
        }
      });
    }
  }

  void changePasswordVisibility(){
    _uiState.update((_) {
      _uiState.value.isPasswordVisible = !uiState.isPasswordVisible;
    });
  }
}

class LoginPageUIState {
  bool isPasswordVisible = false;
  ApiResponse loginApiResponse = ApiResponseFailed();
}