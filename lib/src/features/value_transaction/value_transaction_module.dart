
import 'package:app_financeiro/src/common/application/modules/module.dart';
import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:app_financeiro/src/features/value_transaction/value_transaction_bindings.dart';
import 'package:app_financeiro/src/features/value_transaction/value_transaction_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class ValueTransactionModule extends Module{
  @override
  List<GetPage> routers = [
    GetPage(name: Routes.valueTransaction, page: () => const ValueTransactionPage(), binding: ValueTransactionBindings())
  ];
  
}