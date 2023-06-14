import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/sewa_jual_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/tipe_properti_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/enum/waktu_pembayaran_enum.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_controller.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/submit_properti_dropdown.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/ui_component/submit_properti_text_field.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_controller.dart';

class Form1Screen extends StatelessWidget{
  final Form1Controller controller = Get.find();
  final isSewa = Get.find<SewaJualController>().sewaJual ==
                  SewaJual.sewa;

  Form1Screen({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> form = [
      SubmitPropertiFormField(
        controller : controller.judulC,
        label: "Judul promosi",
      ),

      SubmitPropertiDropdown<TipeProperti>(
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
    ];

    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24
            ),
            child: Column(
              children: [
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context , index){
                          return form[index];
                        },
                        separatorBuilder: (context , index){
                          return SizedBox(height: 24,);
                        },
                        itemCount: form.length
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}