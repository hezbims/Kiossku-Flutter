import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiossku_flutter/fitur_home/data/home_debug_api_client.dart';

class HomeDebugRepository{
  final _apiClient = HomeDebugApiClient();

  Future<bool> debugUploadImages(List<XFile> images) async{
    final response = await _apiClient.debugUploadImages(images);
    debugPrint("ZZZ ${response.bodyString}");
    return response.isOk ? true : false;
  }

}