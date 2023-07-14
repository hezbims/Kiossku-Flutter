import 'package:common/response.dart';
import 'package:dependencies/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_detail_properti/domain/model/detail_properti.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/detail_properti_controller.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/ui_component/detail_properti_app_bar/detail_properti_app_bar.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/ui_component/detail_properti_data/all_detail_properti_data.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/ui_component/image_slider/image_slider.dart';

class DetailPropertiScreen extends StatelessWidget{
  const DetailPropertiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: GetBuilder<DetailPropertiController>(
            builder: (controller) {
              return FutureBuilder(
                future: controller.detailProperti,
                builder: (context , snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    if (data is ApiResponseSuccess) {
                      final DetailProperti detailProperti = data.data;
                      return ListView(
                        children: [
                          const SizedBox(height: 4,),

                          Padding(
                            padding: const EdgeInsets.only(
                              left : 24,
                              right : 24,
                            ),
                            child: DetailPropertiAppBar(sewaJual: detailProperti.sewaJual),
                          ),

                          const SizedBox(height: 20,),

                          ImageSlider(images: detailProperti.images),

                          const SizedBox(height: 24,),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24
                            ),
                            child: AllDetailPropertiData(detailProperti: detailProperti),
                          ),
                        ],
                      );
                    }
                    else if (data is ApiResponseFailed){
                      return InkWell(
                        onTap: controller.loadDetailProperti,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.wifi_off),
                              Text(
                                  data.errorMessage.toString(),
                                  textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    else{ throw Exception("Unknown Error"); }
                  }
                  else{
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              );
            }
          ),
        )
    );
  }
}