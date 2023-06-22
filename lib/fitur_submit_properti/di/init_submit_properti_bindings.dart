import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/repository/daerah_repository.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_2/form_2_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/form_3_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/finish_submit/finish_submit_controller.dart';

class SubmitPropertiBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(Form1Controller(daerahRepository: DaerahRepository()));
    Get.put(Form2Controller());
    Get.put(Form3Controller());
    Get.put(SewaJualController());
  }
}