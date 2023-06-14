import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_login/data/repository/login_repository.dart';
import 'package:kiossku_flutter/fitur_login/presentation/login_controller.dart';

class LoginBindings implements Bindings{
  @override
  void dependencies(){
    Get.put(LoginController(repository: LoginRepository()));
  }
}