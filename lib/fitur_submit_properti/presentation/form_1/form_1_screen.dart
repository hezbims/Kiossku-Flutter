import 'package:dependencies/getx/getx.dart';
import 'package:flutter/material.dart';
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
                      onChanged: controller.changeTipeProperti,
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
                          onChanged: controller.changeWaktuPembayaran,
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
                    isEnabled: controller.isProvinsiFormEnabled,
                    onChanged: controller.changeProvinsi,
                    onReload: controller.reloadProvinsi,
                    response: controller.listProvinsi,
                    currentValue: controller.provinsi,
                  ),

                  const SizedBox(height: 24,),

                  DaerahDropdown(
                    label: "Kabupaten",
                    errorMessage: controller.kabupatenErorr,
                    isEnabled: controller.isKabupatenFormEnabled,
                    onChanged: controller.changeKabupaten,
                    onReload: controller.reloadKabupaten,
                    response: controller.listKabupaten,
                    currentValue: controller.kabupaten,
                  ),

                  const SizedBox(height: 24,),

                  DaerahDropdown(
                    label: "Kecamatan",
                    errorMessage: controller.kecamatanError,
                    isEnabled: controller.isKecamatanFormEnabled,
                    onChanged: controller.changeKecamatan,
                    onReload: controller.reloadKecamatan,
                    response: controller.listKecamatan,
                    currentValue: controller.kecamatan,
                  ),

                  const SizedBox(height: 24,),

                  DaerahDropdown(
                    label: "Kelurahan",
                    errorMessage: controller.kelurahanError,
                    isEnabled: controller.isKelurahanFormEnabled,
                    onChanged: controller.changeKelurahan,
                    onReload: controller.reloadKelurahan,
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