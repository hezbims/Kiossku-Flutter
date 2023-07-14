import 'package:dependencies/getx/getx.dart';

import '../presentation/controller/kiossku_bottom_nav_bar_controller.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(KiosskuBottomNavBarController());
  }

}