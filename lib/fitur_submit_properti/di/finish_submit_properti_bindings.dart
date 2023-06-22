import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/repository/submit_properti_repository.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/finish_submit/finish_submit_controller.dart';

class FinishSubmitPropertiBindigs extends Bindings{

  @override
  void dependencies() {
    Get.put(FinishSubmitController(
        repository: SubmitPropertiRepository()
    ));
  }
}