class NullValidationUseCase{
  String? validate<T>(T? data , {required String errorMessage}){
    if (data == null){
      return errorMessage;
    } else{
      return null;
    }
  }
}