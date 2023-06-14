abstract class ApiResponse{

}

class ApiResponseSuccess<T> implements ApiResponse{
  final T? data;

  ApiResponseSuccess({this.data});
}

class ApiResponseFailed implements ApiResponse{
  String? errorMessage;
  String? errorCode;

  ApiResponseFailed({
    this.errorMessage,
    this.errorCode
  });
}

class ApiResponseLoading implements ApiResponse{}