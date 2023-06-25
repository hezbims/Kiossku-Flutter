import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiossku_flutter/navigation/nav_route.dart';

class Form3Controller extends GetxController{
  final _imagePicker = ImagePicker();

  final List<XFile> images = [];

  Future<void> addNewImages() async{
    images.addAll(
      await _imagePicker.pickMultiImage()
    );
    update();
  }

  void deleteImage(XFile image){
    images.removeWhere((e) => e.hashCode == image.hashCode);
    update();
  }
  
  void clickNext() {
    if (images.isEmpty) {
      Fluttertoast.showToast(msg: "Upload minimal 1 gambar");
    } else {
      Get.toNamed(NavRoute.finishSubmitRoute);
    }
  }
  void clickBack() => Get.back();
}