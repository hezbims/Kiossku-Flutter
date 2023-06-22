import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/form_3_controller.dart';

class TambahGambar extends StatelessWidget{
  const TambahGambar({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<Form3Controller>(
      builder: (controller) {
        return InkWell(
          onTap: controller.addNewImages,
          child: DottedBorder(
              child: Center(
                child: SizedBox(
                  height: 241,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Tambah Gambar"),
                      Icon(Icons.add)
                    ],
                  ),
                ),
              )
          ),
        );
      }
    );
  }
}