import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/detail_properti_controller.dart';

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
                      return Column(
                        children: [
                          SizedBox(
                            height: 241,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Image.network(
                                  controller.getImageUrl(data.data.images[index]),
                                  height: 241,
                                  width: 327,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                );
                              },
                              itemCount: data.data.images.length,
                              separatorBuilder: (context , index){
                                return const SizedBox(width:24,);
                              },
                            ),
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
                              Text(data.errorMessage.toString()),
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