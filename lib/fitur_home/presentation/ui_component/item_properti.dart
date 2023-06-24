import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/common/utils/rupiah_formatter.dart';
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
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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
                  child: CachedNetworkImage(
                    imageUrl : controller.getImageUrl(propertiPreview.thumbnail),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    progressIndicatorBuilder: (context , url , downloadProgress){
                      return Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          )
                      );
                    },
                    errorWidget: (context , url , error){
                      return const Center(
                        child: Icon(Icons.wifi_off),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 8,),

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
                overflow: TextOverflow.ellipsis,
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
                      color: KiosskuColors.label,
                      fontSize: 10
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),

              const SizedBox(height: 8,),

              Text(
                RupiahFormatter.formatToRupiah(propertiPreview.harga),
                style: const TextStyle(
                  color: KiosskuColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 9
                ),
              ),

              const SizedBox(height: 4,),


            ],
          ),
        ),
      ),
    );
  }
}