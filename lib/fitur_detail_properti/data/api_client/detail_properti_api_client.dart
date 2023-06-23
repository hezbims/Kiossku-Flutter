import 'package:get/get.dart';
import 'package:kiossku_flutter/common/constant/url/common_api_url.dart';

class DetailPropertiApiClient extends GetConnect{
  String _getDetailPropertiUrl(int id) {
    return "${CommonApiUrl.localBaseURL}getPropertiById/$id";
  }

  Future<Response> getDetailProperti(int id){
    return get(_getDetailPropertiUrl(id));
  }
}