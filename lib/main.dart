import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'application/bindings/application_bindings.dart';
import 'application/modules/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const FlutterPokedex());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class FlutterPokedex extends StatelessWidget {
  const FlutterPokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      getPages: AppRoutes.routes,
      initialRoute: '/home',
      initialBinding: ApplicationBindings(),
    );
  }
}
