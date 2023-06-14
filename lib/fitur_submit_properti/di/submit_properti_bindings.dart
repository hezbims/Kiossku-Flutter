import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_2/form_2_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/form_3_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/submit_properti_controller.dart';

class SubmitPropertiBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(Form1Controller());
    Get.put(Form2Controller());
    Get.put(Form3Controller());
    Get.put(SewaJualController());
    Get.put(SubmitPropertiController());
  }
}