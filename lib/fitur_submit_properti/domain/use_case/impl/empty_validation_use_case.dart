class EmptyValidationUseCase{
  String? validate(String data , {required String errorMessage}) {
    if (data.isEmpty) {
      return errorMessage;
    } else {
      return null;
    }
  }
}