import 'package:get/get.dart';
import 'package:kiossku_flutter/navigation/nav_route.dart';

import '../../constant/enum/sewa_jual_enum.dart';

class SewaJualController extends GetxController{
  late SewaJual sewaJual;
  void chooseSewa(){
    sewaJual = SewaJual.sewa;
    Get.toNamed(NavRoute.form1SubmitPropertiRoute);
  }

  void chooseJual(){
    sewaJual = SewaJual.jual;
    Get.toNamed(NavRoute.form1SubmitPropertiRoute);
  }
}