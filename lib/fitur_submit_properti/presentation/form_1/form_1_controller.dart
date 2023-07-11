import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/fix_nego_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/sewa_jual_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/tipe_properti_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/waktu_pembayaran_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/string/string_resource.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/dto/daerah_dto.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/repository/i_daerah_repository.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/empty_validation_use_case.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/int_validation_use_case.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/null_validation_use_case.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_controller.dart';
import 'package:kiossku_flutter/navigation/nav_route.dart';


class Form1Controller extends GetxController{

  final IDaerahRepository daerahRepository;
  final EmptyValidationUseCase emptyValidator;
  final NullValidationUseCase nullValidator;
  final IntValidationUseCase intValidator;

  Form1Controller({
      required this.daerahRepository,
      required this.emptyValidator,
      required this.nullValidator,
      required this.intValidator,
  }) : _listProvinsi = daerahRepository.getProvinsi();

  final judulC = TextEditingController();

  TipeProperti? _tipeProperti;
  TipeProperti? get tipeProperti => _tipeProperti;

  final hargaC = TextEditingController();

  WaktuPembayaran? _waktuPembayaran;
  WaktuPembayaran? get waktuPembayaran => _waktuPembayaran;

  FixNego? _fixNego;
  FixNego? get fixNego => _fixNego;

  DaerahDto? _provinsi;
  DaerahDto? get provinsi => _provinsi;

  DaerahDto? _kabupaten;
  DaerahDto? get kabupaten => _kabupaten;

  DaerahDto? _kecamatan;
  DaerahDto? get kecamatan => _kecamatan;

  DaerahDto? _kelurahan;
  DaerahDto? get kelurahan => _kelurahan;

  Future<ApiResponse> _listProvinsi;
  Future<ApiResponse> get listProvinsi => _listProvinsi;

  Future<ApiResponse> _listKabupaten = Future.value(ApiResponseFailed());
  Future<ApiResponse> get listKabupaten => _listKabupaten;

  Future<ApiResponse> _listKecamatan = Future.value(ApiResponseFailed());
  Future<ApiResponse> get listKecamatan => _listKecamatan;

  Future<ApiResponse> _listKelurahan = Future.value(ApiResponseFailed());
  Future<ApiResponse> get listKelurahan => _listKelurahan;

  final alamatC = TextEditingController();

  void changeFixNego(FixNego? newValue){
    if (newValue != null){
      _fixNego = newValue;
      update();
    }
  }

  void changeTipeProperti(TipeProperti? newValue){
    if (newValue != null){
      _tipeProperti = newValue;
      update();
    }
  }

  void changeWaktuPembayaran(WaktuPembayaran? newValue){
    if (newValue != null){
      _waktuPembayaran = newValue;
      update();
    }
  }

  void changeProvinsi(DaerahDto? newValue){
    if (newValue != null && newValue.id != _provinsi?.id){
      _provinsi = newValue;
      _kabupaten = null;
      _kecamatan = null;
      _kelurahan = null;
      reloadKabupaten();
    }
  }

  void changeKabupaten(DaerahDto? newValue){
    if (newValue != null && newValue.id != _kabupaten?.id){
      _kabupaten = newValue;
      _kecamatan = null;
      _kelurahan = null;
      reloadKecamatan();
    }
  }

  void changeKecamatan(DaerahDto? newValue){
    if (newValue != null && newValue.id != _kecamatan?.id){
      _kecamatan = newValue;
      _kelurahan = null;
      reloadKelurahan();
    }
  }

  void changeKelurahan(DaerahDto? newValue){
    if (newValue != null && newValue.id != _kelurahan?.id){
      _kelurahan = newValue;
    }
  }

  void reloadProvinsi() {
    _listProvinsi = daerahRepository.getProvinsi();
    update();
  }
  void reloadKabupaten() {
    _listKabupaten = daerahRepository.getKabupaten(_provinsi!.id);
    update();
  }
  void reloadKecamatan() {
    _listKecamatan = daerahRepository.getKecamatan(_kabupaten!.id);
    update();
  }
  void reloadKelurahan() {
    _listKelurahan = daerahRepository.getKelurahan(_kecamatan!.id);
    update();
  }

  bool isProvinsiFormEnabled = true;
  bool get isKabupatenFormEnabled => _provinsi != null;
  bool get isKecamatanFormEnabled => _kabupaten != null;
  bool get isKelurahanFormEnabled => _kecamatan != null;

  bool get isSewa =>
    Get.find<SewaJualController>().sewaJual == SewaJual.sewa;

  void clickNext() {
    judulError = emptyValidator.validate(judulC.text , errorMessage: StringResource.judulPromosiErrorMessage);
    tipePropertiError = nullValidator.validate(_tipeProperti , errorMessage: StringResource.tipePropertiErrorMessage);
    hargaError = intValidator.validate(hargaC.text , errorMessage: StringResource.hargaErrorMessage);
    if (isSewa) {
      waktuPembayaranError = nullValidator.validate(
          _waktuPembayaran ,
          errorMessage: StringResource.waktuPembayaranErrorMessage
      );
    }
    alamatError = emptyValidator.validate(alamatC.text , errorMessage: StringResource.alamatErrorMessage);
    provinsiError = nullValidator.validate(_provinsi , errorMessage: StringResource.provinsiErrorMessage);
    kabupatenErorr = nullValidator.validate(_kabupaten , errorMessage: StringResource.kabupatenErrorMessage);
    kecamatanError = nullValidator.validate(_kecamatan , errorMessage: StringResource.kecamatanErrorMessage);
    kelurahanError = nullValidator.validate(_kelurahan , errorMessage: StringResource.kelurahanErrorMessage);

    if (noError) {
      Get.toNamed(NavRoute.form2SubmitPropertiRoute);
    }

    update();
  }

  bool get noError {
    return judulError == null &&
      tipePropertiError == null &&
      hargaError == null &&
      waktuPembayaranError == null &&
      alamatError == null &&
      provinsiError == null &&
      kabupatenErorr == null &&
      kecamatanError == null &&
      kelurahanError == null;
  }
  void clickBack() => Get.back();

  String? judulError;
  String? tipePropertiError;
  String? hargaError;
  String? waktuPembayaranError;
  String? alamatError;
  String? provinsiError;
  String? kabupatenErorr;
  String? kecamatanError;
  String? kelurahanError;
}
