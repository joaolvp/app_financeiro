import 'package:app_financeiro/src/common/application/modules/module.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/features/auth/register/register_bindings.dart';
import 'package:app_financeiro/src/features/auth/register/register_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RegisterModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBindings(),
    )
  ];
}
