import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/custom_decoration.dart';

class SubmitPropertiDropdown<T> extends StatelessWidget{

  final String label;
  final void Function(T?) onChanged;
  final List<T> items;
  const SubmitPropertiDropdown({
    super.key,
    required this.label,
    required this.onChanged,
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
        items: items.map((e) =>
            DropdownMenuItem(
                value: e,
                child: Text(e.toString()),
            )
        ).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          border: CustomDecorationProperty.formBorder,
          label: Text(label)
        ),
    );
  }
}