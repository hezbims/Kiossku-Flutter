import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/detail_properti_controller.dart';

class DetailPropertiAppBar extends StatelessWidget{
  final controller = Get.find<DetailPropertiController>();
  final String sewaJual;
  DetailPropertiAppBar({
    super.key,
    required this.sewaJual,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          elevation: 4,
          child: IconButton(
            onPressed: controller.onBackButtonPressed,
            icon: const Icon(
                Icons.arrow_back
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8
            ),
            child: Text(
              sewaJual.toUpperCase(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0x33118E49),
          ),
          child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.favorite_border_outlined)
          ),
        )
      ],
    );
  }
}