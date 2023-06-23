import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/common/presentation/kiossku_bottom_nav_bar.dart';
import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_home/presentation/home_controller.dart';
import 'package:kiossku_flutter/fitur_home/presentation/ui_component/item_properti.dart';
import 'package:kiossku_flutter/navigation/bottom_nav_bar_index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: KiosskuBottomNavBar(
          currentSelectedIndex: BottomNavBarIndex.homeIndex
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return FutureBuilder(
            future: controller.apiResponse,
            builder: (context , snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data!;
                if (data is ApiResponseSuccess) {
                  debugPrint('HomeApiResponse success');
                  return MasonryGridView.count(
                      crossAxisCount: 2,
                      itemBuilder: (context , index){
                        return ItemProperti(propertiPreview: data.data[index]);
                      },
                      itemCount: data.data.length,
                  );
                }
                else if (data is ApiResponseFailed){
                  debugPrint('HomeApiResponse failed');
                  return InkWell(
                    onTap: controller.loadData,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.wifi_off),
                          Text(
                            data.errorMessage.toString(),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                }
                else{ throw Exception("Unknown Error"); }
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          );
        }
      )
    );
  }
}