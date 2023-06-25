import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/tipe_properti_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/waktu_pembayaran_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/daerah_dropdown.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/submit_properti_dropdown.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/submit_properti_text_field.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/ui_component/back_next_button.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/ui_component/form_header.dart';

class Form1Screen extends StatelessWidget{
  const Form1Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24
            ),
            child: GetBuilder<Form1Controller>(
              builder : (controller) => ListView(
                children: [
                  const SizedBox(height: 16,),

                  FormHeader(
                      formNumber: 1,
                      title: "Formulir Properti ${controller.isSewa ? "Disewakan" : "Dijual"}"
                  ),

                  const SizedBox(height: 24,),

                  SubmitPropertiFormField(
                    controller : controller.judulC,
                    label: "Judul promosi",
                    errorMessage: controller.judulError,
                  ),

                  const SizedBox(height: 24,),

                  SubmitPropertiDropdown<TipeProperti>(
                      selectedItem: controller.tipeProperti,
                      label: "Tipe properti",
                      errorMessage: controller.tipePropertiError,
                      onChanged: (newValue){
                        controller.onEvent(
                            ChangeTipeProperti(newValue: newValue)
                        );
                      },
                      items: TipeProperti.values
                  ),

                  const SizedBox(height: 24,),

                  SubmitPropertiFormField(
                      controller: controller.hargaC,
                      errorMessage: controller.hargaError,
                      label: "Harga",
                      isIntField: true,
                  ),

                  const SizedBox(height: 24,),

                  if (controller.isSewa)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: SubmitPropertiDropdown<WaktuPembayaran>(
                          selectedItem: controller.waktuPembayaran,
                          label: "Waktu pembayaran",
                          errorMessage: controller.waktuPembayaranError,
                          onChanged: (newValue){
                            controller.onEvent(
                                ChangeWaktuPembayaran(newValue: newValue)
                            );
                          },
                          items: WaktuPembayaran.values
                      ),
                    ),

                  SubmitPropertiFormField(
                      controller: controller.alamatC,
                      errorMessage: controller.alamatError,
                      label: "Alamat jalan"
                  ),

                  const SizedBox(height: 24,),

                  DaerahDropdown(
                    label: "Provinsi",
                    errorMessage: controller.provinsiError,
                    isVisible: controller.isProvinsiFormVisible,
                    onChanged: (newValue){
                      controller.onEvent(
                          ChangeProvinsi(newValue: newValue)
                      );
                    },
                    onReload: () => controller.onEvent(ReloadProvinsi()),
                    response: controller.listProvinsi,
                    currentValue: controller.provinsi,
                  ),

                  DaerahDropdown(
                    label: "Kabupaten",
                    errorMessage: controller.kabupatenErorr,
                    isVisible: controller.isKabupatenFormVisible,
                    onChanged: (newValue){
                      controller.onEvent(
                          ChangeKabupaten(newValue: newValue)
                      );
                    },
                    onReload: () => controller.onEvent(ReloadKabupaten()),
                    response: controller.listKabupaten,
                    currentValue: controller.kabupaten,
                  ),

                  DaerahDropdown(
                    label: "Kecamatan",
                    errorMessage: controller.kecamatanError,
                    isVisible: controller.isKecamatanFormVisible,
                    onChanged: (newValue){
                      controller.onEvent(
                          ChangeKecamatan(newValue: newValue)
                      );
                    },
                    onReload: () => controller.onEvent(ReloadKecamatan()),
                    response: controller.listKecamatan,
                    currentValue: controller.kecamatan,
                  ),

                  DaerahDropdown(
                    label: "Kelurahan",
                    errorMessage: controller.kelurahanError,
                    isVisible: controller.isKelurahanFormVisible,
                    onChanged: (newValue){
                      controller.onEvent(
                          ChangeKelurahan(newValue: newValue)
                      );
                    },
                    onReload: () => controller.onEvent(ReloadKelurahan()),
                    response: controller.listKelurahan,
                    currentValue: controller.kelurahan,
                  ),

                  const SizedBox(height: 32,),

                  BackNextButton(
                      clickNext: controller.clickNext,
                      clickBack: controller.clickBack
                  ),

                  const SizedBox(height: 24,),
                ],
              ),
            ),
          ),
        )
    );
  }
}