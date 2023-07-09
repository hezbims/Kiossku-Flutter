// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/common/constant/url/assets_url.dart';
import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/finish_submit/finish_submit_controller.dart';
import 'package:kiossku_flutter/theme/kiossku_theme.dart';

class FinishSubmitScreen extends StatelessWidget{
  const FinishSubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<FinishSubmitController>(
          builder : (controller) {
            return FutureBuilder(
                future: controller.apiResponse,
                builder: (context , snapshot){
                  if (snapshot.hasData){
                    final apiResponse = snapshot.data!;
                    if (apiResponse is ApiResponseFailed){
                      return InkWell(
                        onTap: controller.resubmit,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                  Icons.wifi_off,
                                  size: 48,
                              ),

                              const SizedBox(height: 16,),

                              Text(
                                apiResponse.errorMessage.toString(),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    else if (apiResponse is ApiResponseSuccess){
                      return Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                  AssetsUrl.berhasilSubmit,
                                  fit: BoxFit.contain,
                                  alignment: Alignment.center,
                                  width: 260,
                                  height: 260,
                              ),

                              SizedBox(height: 36,),

                              Text(
                                  "Properti anda telah ditambahkan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,

                                  ),
                                  textAlign: TextAlign.center,
                              ),


                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 64,
                                left: 24,
                                right: 24,
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        KiosskuColors.primary
                                      ),
                                      padding: MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(vertical: 16)
                                      ),
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16)
                                        )
                                      )
                                    ),
                                    onPressed: controller.onClickFinish,
                                    child: const Text(
                                        "Selesai"
                                    )
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    else{ throw Exception("Unknown error"); }
                  }
                  else{
                    return SizedBox(
                      width: double.infinity,
                      child: const Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),

                          SizedBox(height: 24,),

                          Text(
                            "Sedang mengupload data...",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                }
            );
          }
        ),
      ),
    );
  }
}