import 'package:get/get.dart';

import '../../../navigation/route.dart';

class KiosskuBottomNavBarController extends GetxController{
  void onClickHome() => Get.offNamed(NavRoute.homeRoute);
  void onClickSewaJual() => Get.offNamed(NavRoute.submitPropertiRoute);
}