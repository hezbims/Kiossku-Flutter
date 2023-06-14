import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:collection/collection.dart';
import 'package:kiossku_flutter/common/constant/url/api_url.dart';

class HomeDebugApiClient extends GetConnect{
  Future<Response> debugUploadImages(
     List<XFile> images 
  ) async{
    assert(images.isNotEmpty);

    Map<String , MultipartFile> dataMap = {};
    images.forEachIndexed((index , file){
      dataMap["images[$index]"] = MultipartFile(
          File(file.path),
          filename : "d"
      );
    });

    final formData = FormData(dataMap);

    return await post(ApiUrl.debugUploadImageURL , formData);
  }
}