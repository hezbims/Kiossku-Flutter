import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/ui_component/image_slider/properti_image.dart';

class ImageSlider extends StatelessWidget{
  final List<String> images;
  const ImageSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 241,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PropertiImage(imageName: images[index]);
        },
        itemCount: images.length,
        separatorBuilder: (context , index){
          return const SizedBox(width:24,);
        },
      ),
    );
  }
}