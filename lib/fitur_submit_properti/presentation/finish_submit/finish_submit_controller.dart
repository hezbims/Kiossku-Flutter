import 'package:get/get.dart';
import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/dto/submit_properti_dto.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/repository/i_submit_properti_repository.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/form_3_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_controller.dart';
import 'package:kiossku_flutter/navigation/nav_route.dart';

import '../form_2/form_2_controller.dart';

class FinishSubmitController extends GetxController{
  final ISubmitPropertiRepository _repository;
  FinishSubmitController({
    required ISubmitPropertiRepository repository  
  }) : _repository = repository;
  
  
  final _sewaJualC = Get.find<SewaJualController>();
  final _form1C = Get.find<Form1Controller>();
  final _form2C = Get.find<Form2Controller>();
  final _form3C = Get.find<Form3Controller>();
  
  late Future<ApiResponse> apiResponse;

  @override
  void onInit() {
    super.onInit();
    resubmit();
  }

  void resubmit(){
    apiResponse = _submitResponse;
  }

  Future<ApiResponse> get _submitResponse =>
      _repository.submitProperti(
          SubmitPropertiDto(
              judulPromosi: _form1C.judulC.text,
              tipeProperti: _form1C.tipeProperti.toString(),
              harga: int.parse(_form1C.hargaC.text),
              waktuPembayaran: _form1C.waktuPembayaran.toString(),
              fixNego: _form1C.fixNego.toString(),
              sewaJual: _sewaJualC.sewaJual.toString(),
              provinsi: _form1C.provinsi!.name,
              kota: _form1C.kabupaten!.name,
              kecamatan: _form1C.kecamatan!.name,
              kelurahan: _form1C.kelurahan!.name,
              luasLahan: int.parse(_form2C.luasLahanC.text),
              luasBangunan: int.parse(_form2C.luasBangunanC.text),
              tingkat: int.parse(_form2C.jumlahLantaiC.text),
              kapasitasListrik: int.parse(_form2C.kapasitasListrikC.text),
              alamat: _form1C.alamatC.text,
              fasilitas: _form2C.fasilitasC.text,
              deskripsi: _form2C.deskripsiC.text,
              panjang: int.parse(_form2C.panjangC.text),
              lebar: int.parse(_form2C.panjangC.text),
              images: _form3C.images
          )
      );

  void onClickFinish() => Get.offNamedUntil(
      NavRoute.submitPropertiRoute,
      (route) => false,
  );
}