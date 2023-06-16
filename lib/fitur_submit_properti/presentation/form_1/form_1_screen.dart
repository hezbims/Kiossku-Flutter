import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/sewa_jual_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/tipe_properti_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/waktu_pembayaran_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/daerah_dropdown.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/submit_properti_dropdown.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/submit_properti_text_field.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/ui_component/back_next_button.dart';

class Form1Screen extends StatelessWidget{
  final isSewa = Get.find<SewaJualController>().sewaJual ==
                  SewaJual.sewa;

  Form1Screen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24
            ),
            child: Column(
              children: [
                Expanded(
                    child: GetBuilder<Form1Controller>(
                      builder : (controller) => ListView(
                        children: [
                          SubmitPropertiFormField(
                            controller : controller.judulC,
                            label: "Judul promosi",
                          ),

                          SubmitPropertiDropdown<TipeProperti>(
                              selectedItem: controller.tipeProperti,
                              label: "Tipe properti",
                              onChanged: (newValue){
                                controller.onEvent(
                                    ChangeTipeProperti(newValue: newValue)
                                );
                              },
                              items: TipeProperti.values
                          ),


                          SubmitPropertiFormField(
                              controller: controller.hargaC,
                              label: "Harga"
                          ),

                          if (isSewa)
                            SubmitPropertiDropdown<WaktuPembayaran>(
                                selectedItem: controller.waktuPembayaran,
                                label: "Waktu pembayaran",
                                onChanged: (newValue){
                                  controller.onEvent(
                                      ChangeWaktuPembayaran(newValue: newValue)
                                  );
                                },
                                items: WaktuPembayaran.values
                            ),

                          SubmitPropertiFormField(
                              controller: controller.alamatC,
                              label: "Alamat jalan"
                          ),

                          DaerahDropdown(
                            label: "Provinsi",
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

                          BackNextButton(
                              clickNext: controller.clickNext,
                              clickBack: controller.clickBack
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}