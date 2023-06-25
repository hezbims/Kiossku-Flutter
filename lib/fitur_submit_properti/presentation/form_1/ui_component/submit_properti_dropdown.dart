import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/custom_decoration.dart';

class SubmitPropertiDropdown<T> extends StatelessWidget{

  final String label;
  final String? errorMessage;
  final void Function(T?) onChanged;
  final List<T> items;
  final T? selectedItem;
  const SubmitPropertiDropdown({
    super.key,
    required this.label,
    required this.errorMessage,
    required this.onChanged,
    required this.items,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
        value: selectedItem,
        items: items.map((e) =>
            DropdownMenuItem(
                value: e,
                child: Text(e.toString()),
            )
        ).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          border: CustomDecorationProperty.formBorder,
          label: Text(label),
          errorText: errorMessage,
        ),
    );
  }
}