import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/fix_nego_enum.dart';
import 'package:kiossku_flutter/navigation/route.dart';

import '../../../common/response.dart';
import '../../constant/enum/tipe_properti_enum.dart';
import '../../constant/enum/waktu_pembayaran_enum.dart';
import '../../data/dto/daerah_dto.dart';
import '../../domain/repository/i_daerah_repository.dart';

class Form1Controller extends GetxController{

  final IDaerahRepository daerahRepository;
  Form1Controller({
      required this.daerahRepository
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

  void onEvent(Form1Event event){
    if (event is ChangeFixNego){
      if (event.newValue != null) {
        _fixNego = event.newValue;
        update();
      }
    }
    else if (event is ChangeTipeProperti){
      if (event.newValue != null){
        _tipeProperti = event.newValue;
        update();
      }
    }
    else if (event is ChangeWaktuPembayaran){
      if (event.newValue != null){
        _waktuPembayaran = event.newValue;
        update();
      }
    }
    else if (event is ChangeProvinsi){
      if (event.newValue != null && event.newValue!.id != _provinsi?.id){
        _provinsi = event.newValue;
        _kabupaten = null;
        _kecamatan = null;
        _kelurahan = null;
        _reloadKabupaten();
      }
    }
    else if (event is ChangeKabupaten){
      if (event.newValue != null && event.newValue!.id != _kabupaten?.id){
        _kabupaten = event.newValue;
        _kecamatan = null;
        _kelurahan = null;
        _reloadKecamatan();
      }
    }
    else if (event is ChangeKecamatan){
      if (event.newValue != null && event.newValue!.id != _kecamatan?.id){
        _kecamatan = event.newValue;
        _kelurahan = null;
        _reloadKelurahan();
      }
    }
    else if (event is ChangeKelurahan){
      if (event.newValue != null && event.newValue!.id != _kelurahan?.id){
        _kelurahan = event.newValue;
      }
    }
    else if (event is ReloadProvinsi){ _reloadProvinsi(); }
    else if (event is ReloadKabupaten){ _reloadKabupaten(); }
    else if (event is ReloadKecamatan){ _reloadKecamatan(); }
    else if (event is ReloadKelurahan){ _reloadKelurahan(); }
  }

  void _reloadProvinsi() {
    _listProvinsi = daerahRepository.getProvinsi();
    update();
  }
  void _reloadKabupaten() {
    _listKabupaten = daerahRepository.getKabupaten(_provinsi!.id);
    update();
  }
  void _reloadKecamatan() {
    _listKecamatan = daerahRepository.getKecamatan(_kabupaten!.id);
    update();
  }
  void _reloadKelurahan() {
    _listKelurahan = daerahRepository.getKelurahan(_kecamatan!.id);
    update();
  }

  bool isProvinsiFormVisible = true;
  bool get isKabupatenFormVisible => _provinsi != null;
  bool get isKecamatanFormVisible => _kabupaten != null;
  bool get isKelurahanFormVisible => _kecamatan != null;

  void clickNext() => Get.toNamed(NavRoute.form2SubmitPropertiRoute);
  void clickBack() => Get.back();
}

class Form1Event {}

class ChangeFixNego extends Form1Event{
  FixNego? newValue;
  ChangeFixNego({required this.newValue});
}

class ChangeTipeProperti extends Form1Event{
  TipeProperti? newValue;
  ChangeTipeProperti({required this.newValue});
}

class ChangeWaktuPembayaran extends Form1Event{
  WaktuPembayaran? newValue;
  ChangeWaktuPembayaran({required this.newValue});
}

class ChangeProvinsi extends Form1Event {
  DaerahDto? newValue;
  ChangeProvinsi({required this.newValue});
}

class ChangeKabupaten extends Form1Event {
  DaerahDto? newValue;
  ChangeKabupaten({required this.newValue});
}

class ChangeKecamatan extends Form1Event {
  DaerahDto? newValue;
  ChangeKecamatan({required this.newValue});
}

class ChangeKelurahan extends Form1Event {
  DaerahDto? newValue;
  ChangeKelurahan({required this.newValue});
}

class ReloadProvinsi extends Form1Event{}
class ReloadKabupaten extends Form1Event{}
class ReloadKecamatan extends Form1Event{}
class ReloadKelurahan extends Form1Event{}
