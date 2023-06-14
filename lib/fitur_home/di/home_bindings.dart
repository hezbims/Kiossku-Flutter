import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_home/data/home_debug_repository.dart';
import 'package:kiossku_flutter/fitur_home/presentation/home_controller.dart';

class HomeBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController(
      repository: HomeDebugRepository()
    ));
  }

}