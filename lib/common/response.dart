abstract class ApiResponse{

}

class ApiResponseSuccess<T> implements ApiResponse{
  final T? data;

  ApiResponseSuccess({this.data});
}

class ApiResponseFailed implements ApiResponse{
  final String? errorMessage;
  final int? errorCode;

  ApiResponseFailed({
    this.errorMessage,
    this.errorCode
  });
}

class ApiResponseLoading implements ApiResponse{

}