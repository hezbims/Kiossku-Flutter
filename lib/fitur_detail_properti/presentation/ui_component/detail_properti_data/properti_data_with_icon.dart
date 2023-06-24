import 'package:flutter/material.dart';
import 'package:kiossku_flutter/theme/kiossku_theme.dart';

class PropertiDataWithIcon extends StatelessWidget{
  final IconData icon;
  final String data;
  const PropertiDataWithIcon({
    super.key,
    required this.icon,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Icon(
              icon,
              color: KiosskuColors.primary,
          ),
          const SizedBox(width: 18,),
          Text(
              data,
              style: const TextStyle(
                color: KiosskuColors.label,
              ),
          )
      ],
    );
  }
}