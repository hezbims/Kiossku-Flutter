import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiossku_flutter/fitur_home/di/home_bindings.dart';
import 'package:kiossku_flutter/fitur_login/di/login_bindings.dart';
import 'package:kiossku_flutter/fitur_login/presentation/login_page.dart';
import 'package:kiossku_flutter/fitur_submit_properti/di/submit_properti_bindings.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_1/form_1_screen.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/form_2/form_2_screen.dart';
import 'package:kiossku_flutter/fitur_submit_properti/presentation/sewa_jual/sewa_jual_screen.dart';
import 'package:kiossku_flutter/navigation/route.dart';
import 'package:kiossku_flutter/theme/kiossku_theme.dart';

import 'fitur_home/presentation/home_page.dart';
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
      initialRoute: NavRoute.submitPropertiRoute,
      getPages: [
        GetPage(
            name: NavRoute.homeRoute ,
            page: () => HomePage(),
            binding : HomeBindings()
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
            page: () => Form1Screen()
        ),
        GetPage(
            name: NavRoute.form2SubmitPropertiRoute,
            page: () => const Form2Screen()
        ),
        GetPage(
          name : NavRoute.form3SubmitPropertiRoute,
          page: () => Form3Screen()
        )
      ],
    );
  }
}


