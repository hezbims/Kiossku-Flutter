import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/custom_decoration.dart';

class SubmitPropertiFormField extends StatelessWidget{

  final TextEditingController controller;
  final String label;

  const SubmitPropertiFormField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: CustomDecorationProperty.formBorder,
        label: Text(label),
      ),
    );
  }
}