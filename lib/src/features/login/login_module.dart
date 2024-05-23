import 'package:app_financeiro/src/common/application/modules/module.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/features/login/login_bindings.dart';
import 'package:app_financeiro/src/features/login/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class LoginModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBindings()
    )
  ];
}
