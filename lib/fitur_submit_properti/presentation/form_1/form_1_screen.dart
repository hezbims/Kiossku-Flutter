import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/sewa_jual_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/tipe_properti_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/waktu_pembayaran_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/daerah_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/daerah_dropdown.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/submit_properti_dropdown.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/submit_properti_text_field.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_controller.dart';

class Form1Screen extends StatelessWidget{
  final Form1Controller form1Controller = Get.find();
  final DaerahController daerahController = Get.find();
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
                    child: Obx(
                      () => ListView(
                        children: [
                          SubmitPropertiFormField(
                            controller : form1Controller.judulC,
                            label: "Judul promosi",
                          ),

                          SubmitPropertiDropdown<TipeProperti>(
                              label: "Tipe properti",
                              onChanged: (newValue){
                                form1Controller.onEvent(
                                    ChangeTipeProperti(newValue: newValue)
                                );
                              },
                              items: TipeProperti.values
                          ),


                          SubmitPropertiFormField(
                              controller: form1Controller.hargaC,
                              label: "Harga"
                          ),

                          if (isSewa)
                            SubmitPropertiDropdown<WaktuPembayaran>(
                                label: "Waktu pembayaran",
                                onChanged: (newValue){
                                  form1Controller.onEvent(
                                      ChangeWaktuPembayaran(newValue: newValue)
                                  );
                                },
                                items: WaktuPembayaran.values
                            ),

                          SubmitPropertiFormField(
                              controller: form1Controller.alamatC,
                              label: "Alamat jalan"
                          ),

                          DaerahDropdown(
                            label: "Provinsi",
                            isVisible: daerahController.isProvinsiFormVisible,
                            onChanged: (newValue){
                              daerahController.onEvent(
                                  ChangeProvinsi(newValue: newValue)
                              );
                            },
                            onReload: () => daerahController.onEvent(ReloadProvinsi()),
                            response: daerahController.daerahState.value.listProvinsi,
                            currentValue: daerahController.daerahState.value.provinsi,
                          ),

                          DaerahDropdown(
                            label: "Kabupaten",
                            isVisible: daerahController.isKabupatenFormVisible,
                            onChanged: (newValue){
                              daerahController.onEvent(
                                  ChangeKabupaten(newValue: newValue)
                              );
                            },
                            onReload: () => daerahController.onEvent(ReloadKabupaten()),
                            response: daerahController.daerahState.value.listKabupaten,
                            currentValue: daerahController.daerahState.value.kabupaten,
                          ),

                          DaerahDropdown(
                            label: "Kecamatan",
                            isVisible: daerahController.isKecamatanFormVisible,
                            onChanged: (newValue){
                              daerahController.onEvent(
                                  ChangeKecamatan(newValue: newValue)
                              );
                            },
                            onReload: () => daerahController.onEvent(ReloadKecamatan()),
                            response: daerahController.daerahState.value.listKecamatan,
                            currentValue: daerahController.daerahState.value.kecamatan,
                          ),

                          DaerahDropdown(
                            label: "Kelurahan",
                            isVisible: daerahController.isKelurahanFormVisible,
                            onChanged: (newValue){
                              daerahController.onEvent(
                                  ChangeKelurahan(newValue: newValue)
                              );
                            },
                            onReload: () => daerahController.onEvent(ReloadKelurahan()),
                            response: daerahController.daerahState.value.listKelurahan,
                            currentValue: daerahController.daerahState.value.kelurahan,
                          ),
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