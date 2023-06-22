import 'package:get/get.dart';
import 'package:kiossku_flutter/common/constant/url/common_api_url.dart';

class HomeApiClient extends GetConnect{

  static const _getPropertiesUrl = "${CommonApiUrl.localBaseURL}getProperties";
  Future<Response> getProperties(){
    return get(_getPropertiesUrl);
  }
}