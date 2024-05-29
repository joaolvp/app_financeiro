import 'package:app_financeiro/src/common/application/bindings/application_bindings.dart';
import 'package:app_financeiro/src/common/constants/app_theme_data.dart';
import 'package:app_financeiro/src/features/home/home_module.dart';
import 'package:app_financeiro/src/features/auth/login/login_module.dart';
import 'package:app_financeiro/src/features/auth/register/register_module.dart';
import 'package:app_financeiro/src/features/splash/splash_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      theme: AppThemeData.lightMode,
      darkTheme: AppThemeData.darkMode,
      //home: const LoginPage(),
      //initialRoute: Routes.login,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...RegisterModule().routers,
        ...HomeModule().routers,
      ],
    );
  }
}
