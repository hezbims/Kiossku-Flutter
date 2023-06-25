import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_detail_properti/domain/model/detail_properti.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/ui_component/detail_properti_data/properti_data_with_icon.dart';

class KartuLuas extends StatelessWidget{
  final DetailProperti detailProperti;
  const KartuLuas({super.key , required this.detailProperti});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0x80000000),
          width: 0.5
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PropertiDataWithIcon(
                icon: Icons.zoom_out_map_outlined,
                data: "Luash lahan : ${detailProperti.luasLahan}",
            ),

            const SizedBox(height: 16,),

            PropertiDataWithIcon(
                icon: Icons.home_work_outlined,
                data: "Luas bangunan : ${detailProperti.luasBangunan}",
            ),

            const SizedBox(height: 16,),

            PropertiDataWithIcon(
                icon: Icons.electric_bolt_outlined,
                data: "Kapasitas listrik : ${detailProperti.kapasitasListrik}",
            ),
          ],
        ),
      ),
    );
  }
}