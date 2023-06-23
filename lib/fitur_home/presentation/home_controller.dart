import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_home/domain/model/filter_data.dart';
import 'package:kiossku_flutter/fitur_home/domain/repository/ihome_repository.dart';
import 'package:kiossku_flutter/navigation/nav_route.dart';

import '../../common/domain/use_case/interface/i_load_image_use_case.dart';
import '../../common/response.dart';

class HomeController extends GetxController{
  final IHomeRepository _repository;
  final ILoadImageUseCase _loadImageUseCase;
  HomeController({
    required IHomeRepository repository,
    required ILoadImageUseCase loadImageUseCase,
  }) : _repository = repository , _loadImageUseCase = loadImageUseCase;

  late Future<ApiResponse> apiResponse;
  void loadData(){
    apiResponse = _repository.getPreviewData(FilterData());
    update();
  }

  String getImageUrl(String imageName) {
    final ret = _loadImageUseCase.getImageUrl(imageName);
    debugPrint(ret);
    return ret;
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void goToDetailProperti(int idProperti){
    Get.toNamed(NavRoute.getDetailPropertiRoute(idProperti));
  }
}