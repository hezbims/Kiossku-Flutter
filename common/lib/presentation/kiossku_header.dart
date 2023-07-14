import 'package:common/constant/url/assets_url.dart';
import 'package:flutter/cupertino.dart';

class KiosskuHeader extends StatelessWidget{
  const KiosskuHeader({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
            AssetsUrl.kiosskuHeader,
            width: 94,

        ),
      ],
    );
  }
}