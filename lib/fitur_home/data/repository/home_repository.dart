import 'package:common/constant/string_resource.dart';
import 'package:common/response.dart';
import 'package:kiossku_flutter/fitur_home/data/api_client/home_api_client.dart';
import 'package:kiossku_flutter/fitur_home/domain/model/filter_data.dart';
import 'package:kiossku_flutter/fitur_home/domain/model/properti_preview.dart';
import 'package:kiossku_flutter/fitur_home/domain/repository/ihome_repository.dart';

class HomeRepository implements IHomeRepository{
  final apiClient = HomeApiClient();

  @override
  Future<ApiResponse> getPreviewData(FilterData filter) async {
    return await apiClient.getProperties().then((response){
      if (response.isOk){
        final body = response.body;
        return ApiResponseSuccess(
          data: body['data'].map((item){
            return PropertiPreview(
                id: item['id'],
                tipeProperti: item['tipeProperti'],
                judulPromosi: item['judulPromosi'],
                alamat: item['alamat'],
                harga: item['harga'],
                thumbnail: item['images'][0]['imageName']
            );
          }).toList()
        );
      }
      else{
        final message = response.body?['message'] ??
            StringResource.failedToConnectMessage;
        return ApiResponseFailed(
          errorMessage: message,
          errorCode: response.statusCode,
        );
      }
    }).catchError((e){
      return ApiResponseFailed(
        errorMessage: e.toString()
      );
    });
  }

}