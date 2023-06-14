import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiossku_flutter/fitur_home/data/home_debug_repository.dart';

class HomeController extends GetxController{
  var isLoading = false.obs;
  var currentImages = <XFile>[].obs;

  final HomeDebugRepository _repository;

  HomeController({
    required HomeDebugRepository repository
  }) : _repository = repository;

  void uploadImages() async{
    isLoading.value = true;
    debugPrint("ZZZZZZ Mulai loading");
    _repository.debugUploadImages(currentImages).then((e){
      isLoading.value = false;
      debugPrint("ZZZZZ ${e.toString()}");
    });
  }

  void pickImages() async{
    try{
      final nextImages = await ImagePicker().pickMultiImage();
      currentImages.value = nextImages;
      debugPrint("QQQQQQQ ${nextImages.length}");
    } catch (e){
      debugPrint(e.toString());
    }
  }
}