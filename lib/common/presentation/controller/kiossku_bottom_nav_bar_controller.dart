import 'package:get/get.dart';

import '../../../navigation/nav_route.dart';

class KiosskuBottomNavBarController extends GetxController{
  void onClickHome() => Get.offNamed(NavRoute.homeRoute);
  void onClickSewaJual() => Get.offNamed(NavRoute.submitPropertiRoute);
}