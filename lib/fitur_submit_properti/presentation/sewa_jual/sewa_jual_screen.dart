import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/common/constant/url/assets_url.dart';
import 'package:kiossku_flutter/common/presentation/kiossku_header.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/ui_component/sewa_jual_card.dart';

import '../../constant/enum/sewa_jual_enum.dart';

class SewaJualScreen extends StatelessWidget{

  final SewaJualController controller = Get.find();
  SewaJualScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16
            ),
            child: Column(
              children: [
                KiosskuHeader(),

                const SizedBox(height: 16,),

                SewaJualCard(
                  tipe: SewaJual.jual,
                  backgroundImageUrl: AssetsUrl.jualBackground,
                  onTap: controller.chooseJual,
                ),

                const SizedBox(height: 16,),

                SewaJualCard(
                    tipe: SewaJual.sewa,
                    backgroundImageUrl: AssetsUrl.sewaBackground,
                    onTap: controller.chooseSewa,
                )
              ],
            ),
          ),
        )
    );
  }
}