import 'package:flutter/material.dart';
import 'package:kiossku_flutter/common/response.dart';
import 'package:kiossku_flutter/fitur_submit_properti/data/dto/daerah_dto.dart';

import '../../../constant/custom_decoration.dart';

class DaerahDropdown extends StatelessWidget{

  final String label;
  final bool isVisible;
  final void Function(DaerahDto?) onChanged;
  final void Function() onReload;
  final Future<ApiResponse> response;
  final DaerahDto? currentValue;
  final String? errorMessage;
  const DaerahDropdown({
    super.key,
    required this.label,
    required this.isVisible,
    required this.onChanged,
    required this.onReload,
    required this.response,
    required this.currentValue,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    if (isVisible) {
      return FutureBuilder(
          future: response,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;

              if (data is ApiResponseSuccess<List<DaerahDto>>) {
                final items = data.data!;
                return DropdownButtonFormField(
                  value: currentValue,
                  items: items.map((e) =>
                      DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      )
                  ).toList(),
                  onChanged: onChanged,
                  decoration: InputDecoration(
                      border: CustomDecorationProperty.formBorder,
                      label: Text(label),
                      errorText: errorMessage
                  ),
                );
              }
              else if (data is ApiResponseFailed) {
                return Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: onReload,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.wifi_off),
                        Text(
                          data.errorMessage.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }
              else {
                throw Exception("Unknown Error");
              }
            }
            else {
              return const CircularProgressIndicator();
            }
          }
      );
    }
    else {
      return const SizedBox.shrink();
    }
  }
}