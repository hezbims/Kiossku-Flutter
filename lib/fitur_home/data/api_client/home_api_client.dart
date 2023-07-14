import 'package:common/constant/url/common_api_url.dart';
import 'package:dependencies/getx/getx.dart';

class HomeApiClient extends GetConnect{

  static const _getPropertiesUrl = "${CommonApiUrl.localBaseURL}getProperties";
  Future<Response> getProperties(){
    return get(_getPropertiesUrl);
  }
}