import 'package:flutter/material.dart';
import 'package:kiossku_flutter/common/utils/rupiah_formatter.dart';
import 'package:kiossku_flutter/fitur_detail_properti/domain/model/detail_properti.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/ui_component/detail_properti_data/kartu_luas.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/ui_component/detail_properti_data/properti_data_with_icon.dart';
import 'package:kiossku_flutter/theme/kiossku_theme.dart';

class AllDetailPropertiData extends StatelessWidget{
  final DetailProperti detailProperti;
  const AllDetailPropertiData({
    super.key,
    required this.detailProperti,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detailProperti.tipeProperti,
          style: const TextStyle(
            color: KiosskuColors.primary,
          ),
        ),

        const SizedBox(height: 8,),

        Text(
          detailProperti.judulPromosi,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

        //const SizedBox(height: 4,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              RupiahFormatter.formatToRupiah(detailProperti.harga),
              style: const TextStyle(
                color: KiosskuColors.primary,
                fontWeight: FontWeight.w600
              ),
            ),

            OutlinedButton(
              onPressed: (){},
              child: Text(
                detailProperti.fixNego,
                style: const TextStyle(
                    color: KiosskuColors.primary,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24,),

        KartuLuas(detailProperti: detailProperti),

        const SizedBox(height: 24,),

        PropertiDataWithIcon(
            icon: Icons.location_pin,
            data: detailProperti.alamat
        ),

        const SizedBox(height: 16,),

        PropertiDataWithIcon(
            icon: Icons.description_outlined,
            data: detailProperti.deskripsi
        ),


      ],

    );
  }
}