import '../../../common/response.dart';

abstract class IDetailPropertiRepository{
  Future<ApiResponse> getDetailProperti(int id);
}