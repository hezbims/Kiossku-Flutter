import 'package:get/get.dart';
import 'package:kiossku_flutter/common/domain/use_case/implementation/load_image_use_case.dart';
import 'package:kiossku_flutter/fitur_home/data/repository/home_repository.dart';
import 'package:kiossku_flutter/fitur_home/presentation/home_controller.dart';

class HomeBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController(
        repository: HomeRepository(),
        loadImageUseCase: LoadImageUseCase()
    ));
  }

}