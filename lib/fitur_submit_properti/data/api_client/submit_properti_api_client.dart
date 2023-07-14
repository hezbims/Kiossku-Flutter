import 'package:common/constant/url/common_api_url.dart';
import 'package:dependencies/getx/getx.dart';

class SubmitPropertiApiClient extends GetConnect{
  static const _submitPropertiUrl = "${CommonApiUrl.localBaseURL}postProduct";

  Future<Response> submitProperti(FormData formData) async{
    return post(_submitPropertiUrl , formData);
  }
}