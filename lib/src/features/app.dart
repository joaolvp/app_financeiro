import 'package:app_financeiro/src/common/constants/app_theme_data.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/features/login/login_bindings.dart';
import 'package:app_financeiro/src/features/login/login_module.dart';
import 'package:app_financeiro/src/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {

  const App({ super.key });

   @override
   Widget build(BuildContext context) {
       return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: LoginBindings(),
      theme: AppThemeData.theme,
      //home: const LoginPage(),
      initialRoute: Routes.login,
      getPages: [
        ...LoginModule().routers,
      ],
    );
  }
}