import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/navigation/route.dart';

class Form2Controller extends GetxController{
  final luasLahanC = TextEditingController();
  final luasBangunanC = TextEditingController();
  final panjangC = TextEditingController();
  final lebarC = TextEditingController();
  final jumlahLantaiC = TextEditingController();
  final kapasitasListrikC = TextEditingController();
  final fasilitasC = TextEditingController();
  final deskripsiC = TextEditingController();

  void clickNext() => Get.toNamed(NavRoute.form3SubmitPropertiRoute);
  void clickBack() => Get.back();
}