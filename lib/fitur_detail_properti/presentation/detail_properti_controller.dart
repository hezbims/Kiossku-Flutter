import 'package:common/domain/use_case/interface/i_load_image_use_case.dart';
import 'package:common/response.dart';
import 'package:dependencies/getx/getx.dart';
import 'package:kiossku_flutter/fitur_detail_properti/domain/repository/i_detail_properti_repository.dart';

class DetailPropertiController extends GetxController{
  final ILoadImageUseCase _loadImageUseCase;
  final IDetailPropertiRepository _repository;
  DetailPropertiController({
    required IDetailPropertiRepository repository,
    required ILoadImageUseCase loadImageUseCase,
  }) : _repository = repository , _loadImageUseCase = loadImageUseCase;

  final int propertiId = int.parse(Get.parameters['id']!);

  late Future<ApiResponse> detailProperti;

  @override
  void onInit() {
    super.onInit();
    loadDetailProperti();
  }

  void loadDetailProperti(){
    detailProperti = _repository.getDetailProperti(propertiId);
    update();
  }

  String getImageUrl(String imageName){
    return _loadImageUseCase.getImageUrl(imageName);
  }

  void reloadImage(int id){
    update([id]);
  }

  void onBackButtonPressed() =>
      Get.back();
}