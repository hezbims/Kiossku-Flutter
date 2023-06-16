import 'package:get/get.dart';
import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/dto/daerah_dto.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/repository/i_daerah_repository.dart';

class DaerahController extends GetxController{

  final IDaerahRepository daerahRepository;
  Rx<DaerahState> daerahState;

  DaerahController({
    required this.daerahRepository
  }) :
    daerahState = DaerahState(
      listProvinsi: daerahRepository.getProvinsi()
    ).obs;

  void _updateDaerahState(DaerahState newDaerahState) =>
    daerahState.update((val) {
      daerahState.value = newDaerahState;
    });

  bool get isProvinsiFormVisible => true;
  bool get isKabupatenFormVisible => daerahState.value.provinsi != null;
  bool get isKecamatanFormVisible => daerahState.value.kabupaten != null;
  bool get isKelurahanFormVisible => daerahState.value.kecamatan != null;

  void onEvent(DaerahEvent event){
    if (event is ChangeProvinsi){
      if (event.newValue != null){
        _updateDaerahState(daerahState.value.copy(
          provinsi: event.newValue,
          kabupaten: null,
          kelurahan: null,
          kecamatan: null,
          listKabupaten: daerahRepository.getKabupaten(event.newValue!.id),
        ));
      }
    }
    else if (event is ChangeKabupaten){
      if (event.newValue != null){
        _updateDaerahState(daerahState.value.copy(
            kabupaten: event.newValue,
            kecamatan: null,
            kelurahan: null,
            listKecamatan: daerahRepository.getKecamatan(event.newValue!.id)
        ));
      }
    }
    else if (event is ChangeKecamatan){
      if (event.newValue != null){
        _updateDaerahState(daerahState.value.copy(
          kecamatan: event.newValue,
          kelurahan: null,
          listKelurahan: daerahRepository.getKelurahan(event.newValue!.id)
        ));
      }
    }
    else if (event is ChangeKelurahan){
      if (event.newValue != null){
        _updateDaerahState(daerahState.value.copy(
          kelurahan: event.newValue
        ));
      }
    }
    else if (event is ReloadProvinsi){
      _updateDaerahState(daerahState.value.copy(
          listKabupaten: daerahRepository.getProvinsi()
      ));
    }
    else if (event is ReloadKabupaten){
      _updateDaerahState(daerahState.value.copy(
          listKabupaten: daerahRepository.getKabupaten(
            daerahState.value.provinsi!.id
          )
      ));
    }
    else if (event is ReloadKecamatan){
      _updateDaerahState(daerahState.value.copy(
          listKabupaten: daerahRepository.getKecamatan(
            daerahState.value.kabupaten!.id
          )
      ));
    }
    else if (event is ReloadKelurahan){
      _updateDaerahState(daerahState.value.copy(
          listKabupaten: daerahRepository.getKelurahan(
            daerahState.value.kecamatan!.id
          )
      ));
    }
  }


}

class DaerahState {
  static final _defaultFuture = Future.value(ApiResponseFailed());

  final Future<ApiResponse> listProvinsi;
  final Future<ApiResponse> listKabupaten;
  final Future<ApiResponse> listKecamatan;
  final Future<ApiResponse> listKelurahan;
  DaerahDto? provinsi;
  DaerahDto? kabupaten;
  DaerahDto? kecamatan;
  DaerahDto? kelurahan;

  DaerahState({
    Future<ApiResponse>? listProvinsi,
    Future<ApiResponse>? listKabupaten,
    Future<ApiResponse>? listKecamatan,
    Future<ApiResponse>? listKelurahan,
    this.provinsi,
    this.kabupaten,
    this.kecamatan,
    this.kelurahan
  }) :
      listProvinsi = listProvinsi ?? _defaultFuture,
      listKabupaten = listKabupaten ?? _defaultFuture,
      listKecamatan = listKecamatan ?? _defaultFuture,
      listKelurahan = listKelurahan ?? _defaultFuture;


  DaerahState copy({
    Future<ApiResponse>? listProvinsi,
    Future<ApiResponse>? listKabupaten,
    Future<ApiResponse>? listKecamatan,
    Future<ApiResponse>? listKelurahan,
    DaerahDto? provinsi,
    DaerahDto? kabupaten,
    DaerahDto? kecamatan,
    DaerahDto? kelurahan,
  }){
    return DaerahState(
      listProvinsi : listProvinsi ?? this.listProvinsi,
      listKabupaten : listKabupaten ?? this.listKabupaten,
      listKecamatan : listKecamatan ?? this.listKecamatan,
      listKelurahan : listKelurahan ?? this.listKelurahan,
      provinsi : provinsi ?? this.provinsi,
      kabupaten : kabupaten ?? this.kabupaten,
      kecamatan : kecamatan ?? this.kecamatan,
      kelurahan : kelurahan ?? this.kelurahan,
    );
  }
}

class DaerahEvent {}

class ChangeProvinsi extends DaerahEvent{
  DaerahDto? newValue;
  ChangeProvinsi({required this.newValue});
}

class ChangeKabupaten extends DaerahEvent{
  DaerahDto? newValue;
  ChangeKabupaten({required this.newValue});
}

class ChangeKecamatan extends DaerahEvent{
  DaerahDto? newValue;
  ChangeKecamatan({required this.newValue});
}

class ChangeKelurahan extends DaerahEvent{
  DaerahDto? newValue;
  ChangeKelurahan({required this.newValue});
}

class ReloadProvinsi extends DaerahEvent{}
class ReloadKabupaten extends DaerahEvent{}
class ReloadKecamatan extends DaerahEvent{}
class ReloadKelurahan extends DaerahEvent{}
