import 'package:common/domain/use_case/implementation/load_image_use_case.dart';
import 'package:dependencies/getx/getx.dart';
import 'package:kiossku_flutter/fitur_detail_properti/data/repository/detail_properti_repository.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/detail_properti_controller.dart';

class DetailPropertiBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(DetailPropertiController(
      loadImageUseCase: LoadImageUseCase(),
      repository: DetailPropertiRepository(),
    ));
  }

}