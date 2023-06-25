import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/empty_validation_use_case.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/int_validation_use_case.dart';
import 'package:kiossku_flutter/navigation/nav_route.dart';

class Form2Controller extends GetxController{
  final EmptyValidationUseCase emptyValidator;
  final IntValidationUseCase intValidator;
  Form2Controller({
    required this.emptyValidator,
    required this.intValidator,
  });

  final luasLahanC = TextEditingController();
  final luasBangunanC = TextEditingController();
  final panjangC = TextEditingController();
  final lebarC = TextEditingController();
  final jumlahLantaiC = TextEditingController();
  final kapasitasListrikC = TextEditingController();
  final fasilitasC = TextEditingController();
  final deskripsiC = TextEditingController();

  String? luasLahanError;
  String? luasBangunanError;
  String? panjangError;
  String? lebarError;
  String? jumlahLantaiError;
  String? kapasitasListrikError;

  void clickNext() {
    luasLahanError = intValidator.validate(luasLahanC.text , errorMessage: "Luas lahan tidak boleh kosong");
    luasBangunanError = intValidator.validate(luasBangunanC.text, errorMessage: "Luas bangunan tidak boleh kosong");
    panjangError = intValidator.validate(panjangC.text, errorMessage: "Panjang bangunan tidak boleh kosong");
    lebarError = intValidator.validate(lebarC.text , errorMessage: "Lebar tidak boleh kosong");
    jumlahLantaiError = intValidator.validate(jumlahLantaiC.text, errorMessage: "Jumlah lantai tidak boleh kosong");
    kapasitasListrikError = intValidator.validate(kapasitasListrikC.text , errorMessage: "Kapasitas listrik tidak boleh kosong");

    if (noError) {
      Get.toNamed(NavRoute.form3SubmitPropertiRoute);
    }

    update();
  }
  bool get noError{
    return luasLahanError == null &&
      luasBangunanError == null &&
      panjangError == null &&
      lebarError == null &&
      jumlahLantaiError == null &&
      kapasitasListrikError == null;
  }

  void clickBack() => Get.back();
}