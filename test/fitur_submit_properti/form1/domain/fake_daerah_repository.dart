import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/dto/daerah_dto.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/repository/i_daerah_repository.dart';

class FakeDaerahRepository implements IDaerahRepository{
  static final _listProvinsi = [
    DaerahDto(id: "1", name: "Bali"),
    DaerahDto(id: "2", name: "Jawa Timur"),
    DaerahDto(id: "3", name: "Jawa Tengah"),
    DaerahDto(id: "4", name: "Nusa Tenggara Barat"),
  ];

  static final _listKabupaten = [
    DaerahDto(id: "5", name: "Denpasar"),
    DaerahDto(id: "6", name: "Surabaya"),
    DaerahDto(id: "7", name: "Klaten"),
    DaerahDto(id: "8", name: "Lombok"),
  ];

  static final _listKecamatan = [
    DaerahDto(id: "9", name: "Kecamatan1"),
    DaerahDto(id: "10", name: "Kecamatan2"),
    DaerahDto(id: "11", name: "Kecamatan3"),
    DaerahDto(id: "12", name: "Kecamatan4"),
  ];

  static final _listKelurahan = [
    DaerahDto(id: "13", name: "Kelurahan1"),
    DaerahDto(id: "14", name: "Kelurahan2"),
    DaerahDto(id: "15", name: "Kelurahan3"),
    DaerahDto(id: "16", name: "Kelurahan4"),
  ];


  
  @override
  Future<ApiResponse> getKabupaten(String id) async {
    return ApiResponseSuccess(data: _listProvinsi);
  }

  @override
  Future<ApiResponse> getKecamatan(String id) async {
    return ApiResponseSuccess(data: _listKabupaten);
  }

  @override
  Future<ApiResponse> getKelurahan(String id) async {
    return ApiResponseSuccess(data: _listKecamatan);
  }

  @override
  Future<ApiResponse> getProvinsi() async {
    return ApiResponseSuccess(data: _listKelurahan);
  }


}