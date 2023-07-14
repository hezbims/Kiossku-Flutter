import 'package:common/di/initial_bindings.dart';
import 'package:common/navigation/nav_route.dart';
import 'package:dependencies/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:kiossku_flutter/fitur_detail_properti/di/detail_properti_bindings.dart';
import 'package:kiossku_flutter/fitur_detail_properti/presentation/detail_properti_screen.dart';
import 'package:kiossku_flutter/fitur_home/di/home_bindings.dart';
import 'package:kiossku_flutter/fitur_login/di/login_bindings.dart';
import 'package:kiossku_flutter/fitur_login/presentation/login_page.dart';
import 'package:kiossku_flutter/fitur_submit_properti/di/finish_submit_properti_bindings.dart';
import 'package:kiossku_flutter/fitur_submit_properti/di/init_submit_properti_bindings.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/finish_submit/finish_submit_screen.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_screen.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_2/form_2_screen.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_screen.dart';
import 'package:kiossku_flutter/theme/kiossku_theme.dart';

import 'fitur_home/presentation/home_screen.dart';
import 'fitur_submit_properti/presentation/form_3/form_3_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: KiosskuColors.primary,
      ),
      initialBinding: InitialBindings(),
      initialRoute: NavRoute.homeRoute,
      getPages: [
        GetPage(
            name: NavRoute.homeRoute ,
            page: () => const HomeScreen(),
            binding : HomeBindings()
        ),
        GetPage(
            name: NavRoute.detailPropertiBaseRoute,
            page: () => const DetailPropertiScreen(),
            binding: DetailPropertiBindings(),
        ),
        GetPage(
            name: NavRoute.loginRoute,
            page: () => LoginPage(),
            binding: LoginBindings()
        ),
        GetPage(
            name: NavRoute.submitPropertiRoute,
            page: () => SewaJualScreen(),
            binding: SubmitPropertiBindings()
        ),
        GetPage(
            name: NavRoute.form1SubmitPropertiRoute,
            page: () => const Form1Screen()
        ),
        GetPage(
            name: NavRoute.form2SubmitPropertiRoute,
            page: () => const Form2Screen()
        ),
        GetPage(
          name : NavRoute.form3SubmitPropertiRoute,
          page: () => const Form3Screen()
        ),
        GetPage(
            name: NavRoute.finishSubmitRoute,
            page: () => const FinishSubmitScreen(),
            binding: FinishSubmitPropertiBindigs()
        )
      ],
    );
  }
}


