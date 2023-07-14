import 'package:common/constant/url/assets_url.dart';
import 'package:flutter/material.dart';
import 'package:kiossku_flutter/theme/kiossku_theme.dart';

class FormHeader extends StatelessWidget{
  final int formNumber;
  final String title;
  const FormHeader({super.key , required this.formNumber , required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
            AssetsUrl.formHeader,
            width: 116,
            height: 110,
        ),

        const SizedBox(width: 20,),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Langkah ke $formNumber dari 3",
                style: const TextStyle(
                  color: KiosskuColors.primary,
                  fontSize: 10
                ),
              ),

              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}