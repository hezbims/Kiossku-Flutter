import 'package:flutter/cupertino.dart';
import 'package:kiossku_flutter/common/constant/url/assets_url.dart';

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