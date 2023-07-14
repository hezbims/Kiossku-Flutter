import 'package:common/navigation/nav_route.dart';
import 'package:dependencies/getx/getx.dart';

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