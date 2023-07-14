import 'package:common/constant/url/assets_url.dart';
import 'package:common/navigation/bottom_nav_bar_index.dart';
import 'package:common/presentation/kiossku_bottom_nav_bar.dart';
import 'package:common/presentation/kiossku_header.dart';
import 'package:dependencies/getx/getx.dart';
import 'package:flutter/material.dart';
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
          bottomNavigationBar: KiosskuBottomNavBar(
              currentSelectedIndex: BottomNavBarIndex.submitPropertiIndex
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16
            ),
            child: Column(
              children: [
                const KiosskuHeader(),

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