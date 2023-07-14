// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:dependencies/getx/getx.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/form_3_controller.dart';
import 'package:kiossku_flutter/theme/kiossku_theme.dart';

class TambahGambar extends StatelessWidget{
  const TambahGambar({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<Form3Controller>(
      builder: (controller) {
        return InkWell(
          onTap: controller.addNewImages,
          child: DottedBorder(
              dashPattern: [10 , 4],
              strokeWidth: 0.5,
              color: KiosskuColors.label,
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              child: SizedBox(
                width: 270,
                height: 241,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        "Tambah Gambar",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(12)
                          ),
                          border: Border.all(
                            color: KiosskuColors.primary
                          )
                        ),
                        child: const Icon(Icons.add)
                    )
                  ],
                ),
              )
          ),
        );
      }
    );
  }
}