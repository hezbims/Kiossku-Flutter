import 'package:common/navigation/nav_route.dart';
import 'package:dependencies/getx/getx.dart';

class KiosskuBottomNavBarController extends GetxController{
  void onClickHome() => Get.offNamed(NavRoute.homeRoute);
  void onClickSewaJual() => Get.offNamed(NavRoute.submitPropertiRoute);
}