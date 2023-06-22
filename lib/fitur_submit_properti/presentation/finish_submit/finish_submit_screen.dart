import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/finish_submit/finish_submit_controller.dart';

class FinishSubmitScreen extends StatelessWidget{
  const FinishSubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GetBuilder<FinishSubmitController>(
            builder : (controller) {
              return FutureBuilder(
                  future: controller.apiResponse,
                  builder: (context , snapshot){
                    if (snapshot.hasData){
                      final apiResponse = snapshot.data!;
                      if (apiResponse is ApiResponseFailed){
                        return InkWell(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.refresh),
                              Text(
                                apiResponse.errorMessage.toString(),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        );
                      }
                      else if (apiResponse is ApiResponseSuccess){
                        return FilledButton(
                            onPressed: controller.onClickFinish,
                            child: const Text("Selesai")
                        );
                      }
                      else{ throw Exception("Unknown error"); }
                    }
                    else{
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          CircularProgressIndicator(),
                          Text(
                            "Sedang mengupload data...",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }
                  }
              );
            }
          ),
        ),
      ),
    );
  }
}