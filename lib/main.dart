import 'package:appstructureapp/initializer.dart';
import 'package:appstructureapp/navigation/navigations.dart';
import 'package:appstructureapp/navigation/routes.dart';
import 'package:appstructureapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'infrastructure/api_provider/log.dart';

Future<void> main() async{
 await Initializer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.home,
      getPages: Nav.routes,
      theme: themeData,
      builder: (context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaler: const TextScaler.linear(1.1)),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      // supportedLocales: AppTranslations.locales,
      // locale: AppTranslations.locale,
      // fallbackLocale: AppTranslations.fallbackLocale,
      // translations: AppTranslations(),
    );
  }
}

