import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/api_url/daerah_url.dart';

class DaerahApiClient extends GetConnect{
  Future<Response> getKabupaten(String id) =>
    get(DaerahUrl.getKabupatenUrl(id));

  Future<Response> getKecamatan(String id) =>
    get(DaerahUrl.getKecamatanUrl(id));

  Future<Response> getKelurahan(String id) =>
    get(DaerahUrl.getKelurahanUrl(id));

  Future<Response> getProvinsi() =>
    get(DaerahUrl.provinsiUrl);
}