import 'package:common/constant/string_resource.dart';
import 'package:dependencies/getx/getx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/fix_nego_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/sewa_jual_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/tipe_properti_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/waktu_pembayaran_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/dto/daerah_dto.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/empty_validation_use_case.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/int_validation_use_case.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/null_validation_use_case.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_controller.dart';

import '../domain/fake_daerah_repository.dart';

void main(){
  DaerahDto provinsiJawaTimur = DaerahDto(id: "1" , name: "Jawa Timur");
  DaerahDto provinsiBali = DaerahDto(id : "2" , name : "Bali");

  DaerahDto kotaSurabaya = DaerahDto(id: "3", name: "Surabaya");
  DaerahDto kotaDenpasar = DaerahDto(id: "4", name: "Denpasar");

  DaerahDto kecamatanSukolilo = DaerahDto(id: "4", name: "Sukolilo");

  DaerahDto kelurahaSukaSuka = DaerahDto(id: "5", name: "SukaSuka");
  
  late SewaJualController sewaJualController;
  late Form1Controller form1controller;
  
  void setupSewaJualController({SewaJual defaultValue = SewaJual.sewa}){
    sewaJualController = SewaJualController();
    sewaJualController.sewaJual = defaultValue;
    Get.put(sewaJualController);
  }
  
  setUp((){
    Get.testMode = true;
    setupSewaJualController();  
    
    form1controller = Form1Controller(
        daerahRepository: FakeDaerahRepository(), 
        emptyValidator: EmptyValidationUseCase(), 
        nullValidator: NullValidationUseCase(), 
        intValidator: IntValidationUseCase()
    );
  });
  
  test(
      "Diberikan semua field kosong "
      "Ketika validation terjadi "
      "Maka semua field akan menampilkan error "

      "Ketika semua field diisi dengan benar dan divalidasi "
      "Maka semua error akan hilang "

      , (){
     form1controller.clickNext();
     expect(form1controller.judulError , StringResource.judulPromosiErrorMessage);
     expect(form1controller.tipePropertiError , StringResource.tipePropertiErrorMessage);
     expect(form1controller.hargaError , StringResource.hargaErrorMessage);
     expect(form1controller.waktuPembayaranError , StringResource.waktuPembayaranErrorMessage);
     expect(form1controller.alamatError , StringResource.alamatErrorMessage);
     expect(form1controller.provinsiError , StringResource.provinsiErrorMessage);
     expect(form1controller.kabupatenErorr , StringResource.kabupatenErrorMessage);
     expect(form1controller.kecamatanError , StringResource.kecamatanErrorMessage);
     expect(form1controller.kelurahanError , StringResource.kelurahanErrorMessage);

     form1controller.judulC.text = "Kios Mantap";
     form1controller.hargaC.text = "10000000";
     form1controller.changeTipeProperti(TipeProperti.kios);
     form1controller.changeWaktuPembayaran(WaktuPembayaran.tahunan);
     form1controller.changeFixNego(FixNego.fix);
     form1controller.alamatC.text = "Jl Keputih Tegal";
     form1controller.changeProvinsi(provinsiJawaTimur);
     form1controller.changeKabupaten(kotaSurabaya);
     form1controller.changeKecamatan(kecamatanSukolilo);
     form1controller.changeKelurahan(kelurahaSukaSuka);
     form1controller.clickNext();

     expect(form1controller.judulError , null);
     expect(form1controller.tipePropertiError, null);
     expect(form1controller.hargaError , null);
     expect(form1controller.waktuPembayaranError, null);
     expect(form1controller.alamatError , null);
     expect(form1controller.provinsiError , null);
     expect(form1controller.kabupatenErorr, null);
     expect(form1controller.kecamatanError , null);
     expect(form1controller.kelurahanError , null);
  });

  testWidgets(
      "Diberikan awalan semua daerah kosong "
          "Ketika provinsi sampai kelurahan dipilih, lalu provinsi, kabupaten dipilih kembali"
          "Maka kecamatan, dan kelurahan kembali null",
      (widgetTester) async {
        form1controller.changeProvinsi(provinsiJawaTimur);
        expect(form1controller.provinsi, provinsiJawaTimur);
        expect(form1controller.kabupaten, null);
        expect(form1controller.kecamatan , null);
        expect(form1controller.kelurahan, null);

        form1controller.changeKabupaten(kotaSurabaya);
        expect(form1controller.provinsi, provinsiJawaTimur);
        expect(form1controller.kabupaten, kotaSurabaya);
        expect(form1controller.kecamatan , null);
        expect(form1controller.kelurahan, null);

        form1controller.changeKecamatan(kecamatanSukolilo);
        expect(form1controller.provinsi, provinsiJawaTimur);
        expect(form1controller.kabupaten, kotaSurabaya);
        expect(form1controller.kecamatan , kecamatanSukolilo);
        expect(form1controller.kelurahan, null);

        form1controller.changeKelurahan(kelurahaSukaSuka);
        expect(form1controller.provinsi, provinsiJawaTimur);
        expect(form1controller.kabupaten, kotaSurabaya);
        expect(form1controller.kecamatan , kecamatanSukolilo);
        expect(form1controller.kelurahan, kelurahaSukaSuka);

        form1controller.changeProvinsi(provinsiBali);
        expect(form1controller.provinsi, provinsiBali);
        expect(form1controller.kabupaten, null);
        expect(form1controller.kecamatan , null);
        expect(form1controller.kelurahan, null);

        form1controller.changeKabupaten(kotaDenpasar);
        expect(form1controller.provinsi, provinsiBali);
        expect(form1controller.kabupaten, kotaDenpasar);
        expect(form1controller.kecamatan , null);
        expect(form1controller.kelurahan, null);

      }
  );
}