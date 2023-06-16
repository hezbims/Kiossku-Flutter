import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/submit_properti_text_field.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_2/form_2_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/ui_component/back_next_button.dart';

class Form2Screen extends StatelessWidget{

  const Form2Screen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: GetBuilder<Form2Controller>(
                  builder: (controller) {
                    return ListView(
                      children: [
                        SubmitPropertiFormField(
                            controller: controller.luasLahanC,
                            label: "Luas lahan"
                        ),
                        SubmitPropertiFormField(
                            controller: controller.luasBangunanC,
                            label: "Luas bangunan"
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: SubmitPropertiFormField(
                                  controller: controller.panjangC,
                                  label: "Panjang"
                              ),
                            ),
                            Expanded(
                              child: SubmitPropertiFormField(
                                  controller: controller.lebarC,
                                  label: "Lebar"
                              ),
                            )
                          ],
                        ),
                        SubmitPropertiFormField(
                            controller: controller.jumlahLantaiC,
                            label: "Jumlah lantai"
                        ),
                        SubmitPropertiFormField(
                            controller: controller.kapasitasListrikC,
                            label: "Kapasitas listrik"
                        ),
                        SubmitPropertiFormField(
                            controller: controller.fasilitasC,
                            label: "Fasilitas"
                        ),
                        SubmitPropertiFormField(
                            controller: controller.deskripsiC,
                            label: "Deskripsi"
                        ),
                        BackNextButton(
                            clickNext: controller.clickNext,
                            clickBack: controller.clickBack
                        )
                      ],
                    );
                  }
                ),
              )
            ],
          ),
        )
    );
  }
}