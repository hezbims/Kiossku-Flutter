
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/form_3_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/ui_component/deletable_gambar.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/ui_component/tambah_gambar.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/ui_component/back_next_button.dart';

class Form3Screen extends StatelessWidget{
  const Form3Screen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GetBuilder<Form3Controller>(
              builder: (controller) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                          children : [
                            const TambahGambar(),
                            ...List.generate(
                                controller.images.length ,
                                    (index) =>
                                    Padding(
                                      padding: const EdgeInsets.only(top : 24),
                                      child: DeletableGambar(
                                          image: controller.images[index],
                                          onClickDelete: (){
                                            controller.deleteImage(
                                                controller.images[index]
                                            );
                                          }
                                      ),
                                    )
                            )
                          ]
                      ),
                    ),

                    BackNextButton(
                        clickNext: controller.clickNext,
                        clickBack: controller.clickBack,
                        nextText: "Selesai",
                    )
                  ],
                );
              }
            ),
          ),
        )
    );
  }
}