import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_home/presentation/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(
          () => !controller.isLoading.value ?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.currentImages.isNotEmpty)
                Image.file(File(controller.currentImages[0].path)),
              FilledButton(onPressed: controller.uploadImages, child : Text("Upload"))
            ],
          ):
            const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.pickImages,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}