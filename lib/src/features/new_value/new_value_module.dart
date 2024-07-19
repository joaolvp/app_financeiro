
import 'package:app_financeiro/src/common/application/modules/module.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/features/new_value/new_value_bindings.dart';
import 'package:app_financeiro/src/features/new_value/new_value_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class NewValueModule extends Module{
  @override
  List<GetPage> routers = [
    GetPage(name: Routes.newValue, page: () => const NewValuePage(), binding: NewValueBindings())
  ];
  
}