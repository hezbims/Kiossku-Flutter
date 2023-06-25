class IntValidationUseCase {
  String? validate(String data , {required String errorMessage}){
    try{
      int.parse(data);
      return null;
    } on FormatException catch (_){
      return errorMessage;
    }
  }
}