import 'package:common/constant/string_resource.dart';
import 'package:common/response.dart';
import 'package:kiossku_flutter/fitur_detail_properti/data/api_client/detail_properti_api_client.dart';
import 'package:kiossku_flutter/fitur_detail_properti/domain/model/detail_properti.dart';
import 'package:kiossku_flutter/fitur_detail_properti/domain/repository/i_detail_properti_repository.dart';

class DetailPropertiRepository extends IDetailPropertiRepository{
  final _apiClient = DetailPropertiApiClient();

  @override
  Future<ApiResponse> getDetailProperti(int id) async {
    return await _apiClient.getDetailProperti(id).then((response){
      if (response.isOk){
        final data = response.body['data'];

        return ApiResponseSuccess(
          data: DetailProperti(
              judulPromosi: data['judulPromosi'],
              harga: data['harga'],
              waktuPembayaran: data['waktuPembayaran'],
              tipeProperti: data['tipeProperti'],
              fixNego: data['fixNego'],
              sewaJual: data['sewaJual'],
              provinsi: data['provinsi'],
              kota: data['kota'],
              kecamatan: data['kecamatan'],
              kelurahan: data['kelurahan'],
              luasBangunan: data['luasBangunan'],
              luasLahan: data['luasLahan'],
              tingkat: data['tingkat'],
              kapasitasListrik: data['kapasitasListrik'],
              alamat: data['alamat'],
              fasilitas: data['fasilitas'],
              deskripsi: data['deskripsi'],
              panjang: data['panjang'],
              lebar: data['lebar'],
              images: data['images'].map((imageJson){
                return imageJson['imageName'];
              }).toList().cast<String>()
          )
        );
      }
      else{
        final String errorMessage = response.body?['message'] ??
          StringResource.failedToConnectMessage;
        return ApiResponseFailed(
          errorMessage: errorMessage,
          errorCode: response.statusCode,
        );
      }
    }).catchError((error){
      return ApiResponseFailed(
        errorMessage: error.toString(),
      );
    });
  }

}