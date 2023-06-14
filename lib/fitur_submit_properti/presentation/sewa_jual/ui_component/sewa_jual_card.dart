import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_submit_properti/constant/custom_colors.dart';

import '../../../constant/enum/sewa_jual_enum.dart';

class SewaJualCard extends StatelessWidget{
  final SewaJual tipe;
  final String backgroundImageUrl;
  final void Function() onTap;

  const SewaJualCard({
    super.key,
    required this.tipe,
    required this.backgroundImageUrl,
    required this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12
        )
      ),
      child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                  backgroundImageUrl,
                  color: CustomColors.sewaJualBackground,
                  colorBlendMode: BlendMode.darken,
                  fit: BoxFit.cover,
              ),
            ),

            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 1
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))
                ),
                child: TextButton(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 6 , horizontal: 24)
                      ),
                    ),
                    onPressed: onTap,
                    child: Text(
                      tipe.toString(),
                      style: const TextStyle(
                          color: Colors.white
                      ),
                    )
                ),
              ),
            ),

            Positioned.fill(
              left: 16,
              child : Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 132,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${tipe == SewaJual.sewa ? "Sewakan" : "Jual"} "
                        "kios terbaikmu di kiossku.com",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter'
                        ),
                      ),
                      const Text(
                        "#RealProperty",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}