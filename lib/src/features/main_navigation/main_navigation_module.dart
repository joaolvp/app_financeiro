
import 'package:app_financeiro/src/common/application/modules/module.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/features/main_navigation/main_navigation_bindings.dart';
import 'package:app_financeiro/src/features/main_navigation/main_navigation_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MainNavigationModule extends Module{
  @override
  List<GetPage> routers = [
    GetPage(name: Routes.mainNavigation, page: () => const MainNavigationPage(), binding: MainNavigationBindings())
  ];
  
}