import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/custom_decoration.dart';

class SubmitPropertiFormField extends StatelessWidget{

  final TextEditingController controller;
  final String label;
  final String? errorMessage;
  final bool isIntField;

  const SubmitPropertiFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.errorMessage,
    this.isIntField = false,
  });

  @override
  Widget build(BuildContext context) {
    TextInputType? inputType;
    List<TextInputFormatter>? inputFormatters;
    if (isIntField){
      inputType = TextInputType.number;
      inputFormatters = [
        FilteringTextInputFormatter.allow(RegExp("^[1-9][0-9]*")),
      ];
    }


    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: CustomDecorationProperty.formBorder,
        label: Text(label),
        errorText: errorMessage,
      ),
      keyboardType: inputType,
      inputFormatters: inputFormatters,
    );
  }
}