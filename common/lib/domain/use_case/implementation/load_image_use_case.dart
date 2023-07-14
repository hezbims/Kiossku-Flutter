import 'package:common/constant/url/common_api_url.dart';
import 'package:common/domain/use_case/interface/i_load_image_use_case.dart';

class LoadImageUseCase extends ILoadImageUseCase{
  static const _getImageBaseUrl = "${CommonApiUrl.localBaseURL}getImage/";
  @override
  String getImageUrl(String imageName) =>
      "$_getImageBaseUrl$imageName";

}