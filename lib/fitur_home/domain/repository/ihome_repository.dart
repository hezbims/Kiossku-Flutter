import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_home/domain/model/filter_data.dart';

abstract class IHomeRepository{
  Future<ApiResponse> getPreviewData(
      FilterData filter
  );
}