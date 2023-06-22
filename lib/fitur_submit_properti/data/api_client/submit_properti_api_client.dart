import 'package:get/get.dart';
import 'package:kiossku_flutter/common/constant/url/common_api_url.dart';

class SubmitPropertiApiClient extends GetConnect{
  static const _submitPropertiUrl = "${CommonApiUrl.localBaseURL}postProduct";

  Future<Response> submitProperti(FormData formData) async{
    return post(_submitPropertiUrl , formData);
  }
}