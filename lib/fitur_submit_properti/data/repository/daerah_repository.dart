import 'package:common/response.dart';
import 'package:dependencies/getx/getx.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/api_client/daerah_api_client.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/dto/daerah_dto.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/repository/i_daerah_repository.dart';

class DaerahRepository implements IDaerahRepository{
  final apiClient = DaerahApiClient();
  
  @override
  Future<ApiResponse> getKabupaten(String id) async {
    return await getDaerah(
      apiClient.getKabupaten(id)
    );
  }

  @override
  Future<ApiResponse> getKecamatan(String id) async {
    return await getDaerah(
      apiClient.getKecamatan(id)
    );
  }

  @override
  Future<ApiResponse> getKelurahan(String id) async {
    return await getDaerah(
      apiClient.getKelurahan(id)
    );
  }

  @override
  Future<ApiResponse> getProvinsi() async {
    return await getDaerah(
      apiClient.getProvinsi()
    );
  }

  Future<ApiResponse> getDaerah(Future<Response> daerahFuture) async {
    return await daerahFuture
        .then((apiResponse){
      if (apiResponse.isOk){
        final List<dynamic> jsonList = apiResponse.body;
        return ApiResponseSuccess(
            data: jsonList.map(
              (e) => DaerahDto.fromJson(e)
            ).toList()
        );
      }
      else{
        return ApiResponseFailed(
            errorMessage: apiResponse.bodyString,
            errorCode: apiResponse.statusCode
        );
      }
    })
        .catchError((error) {
      return ApiResponseFailed(
          errorMessage : "Gagal tersambung ke server\ntap untuk mereload"
      );
    });
  }
}