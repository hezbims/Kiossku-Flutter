import 'package:get/get.dart';
import 'package:kiossku_flutter/common/constant/string_resource.dart';
import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/api_client/submit_properti_api_client.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/dto/submit_properti_dto.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/repository/i_submit_properti_repository.dart';

class SubmitPropertiRepository implements ISubmitPropertiRepository{
  final apiClient = SubmitPropertiApiClient();

  @override
  Future<ApiResponse> submitProperti(SubmitPropertiDto data) async {
    final formData = FormData(data.toMap());
    return await apiClient.submitProperti(formData).then(
      (response){
        if (response.isOk){
          return ApiResponseSuccess();
        } else {
          return ApiResponseFailed(
            errorMessage: response.bodyString ?? StringResource.failedToConnectMessage,
            errorCode: response.statusCode
          );
        }
      }
    ).catchError((e){
      return ApiResponseFailed(
        errorMessage: e?.toString() ?? "Unknown Error"
      );
    });
  }

}