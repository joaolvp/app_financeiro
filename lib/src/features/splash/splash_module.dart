import 'package:app_financeiro/src/common/application/modules/module.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/features/splash/splash_bindings.dart';
import 'package:app_financeiro/src/features/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBindings()
    )
  ];
}
