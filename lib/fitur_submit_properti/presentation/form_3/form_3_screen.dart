
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/form_3_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/ui_component/deletable_gambar.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_3/ui_component/tambah_gambar.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/ui_component/back_next_button.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/ui_component/form_header.dart';

class Form3Screen extends StatelessWidget{
  const Form3Screen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: GetBuilder<Form3Controller>(
            builder: (controller) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children : [
                              const SizedBox(height: 16,),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: FormHeader(
                                    formNumber: 3,
                                    title: "Form Dokumentasi Properti"
                                ),
                              ),

                              const SizedBox(height: 24,),

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
                              ),
                              SizedBox(height: 32,)
                            ]
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: BackNextButton(
                        clickNext: controller.clickNext,
                        clickBack: controller.clickBack,
                        nextText: "Selesai",
                    ),
                  )
                ],
              );
            }
          ),
        )
    );
  }
}