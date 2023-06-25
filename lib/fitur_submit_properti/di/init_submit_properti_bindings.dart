import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/repository/daerah_repository.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/empty_validation_use_case.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/int_validation_use_case.dart';
import 'package:kiossku_flutter/fitur_submit_properti/domain/use_case/impl/null_validation_use_case.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_2/form_2_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/form_3_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_controller.dart';

class SubmitPropertiBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(Form1Controller(
        daerahRepository: DaerahRepository(),
        emptyValidator: EmptyValidationUseCase(),
        nullValidator: NullValidationUseCase(),
        intValidator: IntValidationUseCase(),
    ));
    Get.put(Form2Controller(
      emptyValidator: EmptyValidationUseCase(),
      intValidator: IntValidationUseCase(),
    ));
    Get.put(Form3Controller());
    Get.put(SewaJualController());
  }
}