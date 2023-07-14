import 'package:dependencies/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/submit_properti_text_field.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_2/form_2_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/ui_component/back_next_button.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/ui_component/form_header.dart';

class Form2Screen extends StatelessWidget{

  const Form2Screen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GetBuilder<Form2Controller>(
              builder: (controller) {
                return ListView(
                  children: [
                    const SizedBox(height: 16,),

                    const FormHeader(
                        formNumber: 2,
                        title: "Formulir Spesifikasi Properti"
                    ),

                    const SizedBox(height: 24,),

                    SubmitPropertiFormField(
                        controller: controller.luasLahanC,
                        label: "Luas lahan",
                        errorMessage: controller.luasLahanError,
                        isIntField: true,
                    ),

                    const SizedBox(height: 24,),

                    SubmitPropertiFormField(
                        controller: controller.luasBangunanC,
                        label: "Luas bangunan",
                        errorMessage: controller.luasBangunanError,
                        isIntField: true,
                    ),

                    const SizedBox(height: 24,),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: SubmitPropertiFormField(
                              controller: controller.panjangC,
                              label: "Panjang",
                              errorMessage: controller.panjangError,
                              isIntField: true,
                          ),
                        ),

                        const SizedBox(width: 16,),

                        Expanded(
                          child: SubmitPropertiFormField(
                              controller: controller.lebarC,
                              label: "Lebar",
                              errorMessage: controller.lebarError,
                              isIntField: true,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 24,),

                    SubmitPropertiFormField(
                        controller: controller.jumlahLantaiC,
                        label: "Jumlah lantai",
                        errorMessage: controller.jumlahLantaiError,
                        isIntField: true,
                    ),

                    const SizedBox(height: 24,),

                    SubmitPropertiFormField(
                        controller: controller.kapasitasListrikC,
                        label: "Kapasitas listrik",
                        errorMessage: controller.kapasitasListrikError,
                        isIntField: true,
                    ),

                    const SizedBox(height: 24,),

                    SubmitPropertiFormField(
                        controller: controller.fasilitasC,
                        label: "Fasilitas (opsional)",
                        errorMessage: null,
                    ),

                    const SizedBox(height: 24,),

                    SubmitPropertiFormField(
                        controller: controller.deskripsiC,
                        label: "Deskripsi (opsional)",
                        errorMessage: null,
                    ),

                    const SizedBox(height: 32,),

                    BackNextButton(
                        clickNext: controller.clickNext,
                        clickBack: controller.clickBack
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