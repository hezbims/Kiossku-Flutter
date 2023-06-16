import 'package:kiossku_flutter/common/response.dart';

abstract class IDaerahRepository {
  Future<ApiResponse> getKabupaten(String id);
  Future<ApiResponse> getKecamatan(String id);
  Future<ApiResponse> getKelurahan(String id);
  Future<ApiResponse> getProvinsi();
}
