import 'package:cached_network_image/cached_network_image.dart';
import 'package:dependencies/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/detail_properti_controller.dart';

class PropertiImage extends StatelessWidget{
  final String imageName;
  const PropertiImage({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GetBuilder<DetailPropertiController>(
        id: imageName.hashCode,
        builder: (controller) {
          return CachedNetworkImage(
            imageUrl : controller.getImageUrl(imageName),
            height: 241,
            width: 327,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            progressIndicatorBuilder: (context, url, downloadProgress){
              return Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              );
            },
            errorWidget: (context , url , error){
              return InkWell(
                onTap: (){
                  controller.reloadImage(imageName.hashCode);
                },
                child: const Center(
                  child: Icon(Icons.wifi_off),
                ),
              );
            },
          );
        }
      ),
    );
  }
}