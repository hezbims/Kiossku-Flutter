import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_home/domain/model/properti_preview.dart';
import 'package:kiossku_flutter/fitur_home/presentation/home_controller.dart';
import 'package:kiossku_flutter/theme/kiossku_theme.dart';

class ItemProperti extends StatelessWidget{
  final controller = Get.find<HomeController>();
  final PropertiPreview propertiPreview;
  ItemProperti({
    super.key,
    required this.propertiPreview
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.goToDetailProperti(propertiPreview.id);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 140 / 119,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    controller.getImageUrl(propertiPreview.thumbnail),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),

              Text(
                propertiPreview.tipeProperti,
                style: const TextStyle(
                  color: KiosskuColors.primary,
                  fontSize: 10,
                  fontFamily: 'Poppins'
                ),
              ),

              Text(
                propertiPreview.judulPromosi,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                      Icons.location_pin,
                      size: 13,
                      color: KiosskuColors.primary,
                  ),

                  Text(
                    propertiPreview.alamat,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10
                    ),
                  ),
                ],
              ),

              Text(
                propertiPreview.harga.toString(),
                style: const TextStyle(
                  color: KiosskuColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 9
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}