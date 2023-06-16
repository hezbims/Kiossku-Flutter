import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/fix_nego_enum.dart';

import '../../constant/enum/tipe_properti_enum.dart';
import '../../constant/enum/waktu_pembayaran_enum.dart';

class Form1Controller extends GetxController{
  final judulC = TextEditingController();

  TipeProperti? _tipeProperti;
  TipeProperti? get tipeProperti => _tipeProperti;

  final hargaC = TextEditingController();

  WaktuPembayaran? _waktuPembayaran;
  WaktuPembayaran? get waktuPembayaran => _waktuPembayaran;

  FixNego? _fixNego;
  FixNego? get fixNego => _fixNego;

  String? _provinsi;
  String? get provinsi => _provinsi;

  String? _kabupaten;
  String? get kabupaten => _kabupaten;

  String? _kecamatan;
  String? get kecamatan => _kecamatan;

  String? _kelurahan;
  String? get kelurahan => _kelurahan;

  final alamatC = TextEditingController();


  void onEvent(Form1Event event){
    if (event is ChangeFixNego){
      if (event.newValue != null) {
        _fixNego = event.newValue;
      }
    }
    else if (event is ChangeTipeProperti){
      if (event.newValue != null){
        _tipeProperti = event.newValue;
      }
    }
    else if (event is ChangeWaktuPembayaran){
      if (event.newValue != null){
        _waktuPembayaran = event.newValue;
      }
    }
  }
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
