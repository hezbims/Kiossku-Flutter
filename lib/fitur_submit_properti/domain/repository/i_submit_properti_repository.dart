import 'package:common/response.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/dto/submit_properti_dto.dart';

abstract class ISubmitPropertiRepository{
  Future<ApiResponse> submitProperti(SubmitPropertiDto data);
}