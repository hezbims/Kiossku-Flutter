import 'package:kiossku_flutter/common/response.dart';

abstract class ILoginRepository {
  Future<ApiResponse> submitData({
    required String email,
    required String password
  });
}