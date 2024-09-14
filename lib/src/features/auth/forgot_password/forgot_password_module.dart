
import 'package:app_financeiro/src/common/application/modules/module.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/features/auth/forgot_password/forgot_password_bindings.dart';
import 'package:app_financeiro/src/features/auth/forgot_password/forgot_password_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class ForgotPasswordModule extends Module{
  @override
  List<GetPage> routers = [
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBindings()
    )
  ];
  
}