
import 'package:app_financeiro/src/common/application/auth/auth_service.dart';
import 'package:app_financeiro/src/services/auth/login/login_service.dart';
import 'package:app_financeiro/src/services/auth/login/login_service_impl.dart';
import 'package:app_financeiro/src/services/transaction/transaction_service.dart';
import 'package:app_financeiro/src/services/transaction/transaction_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginService>(LoginServiceImpl());
    Get.put(AuthService()).init();


    Get.lazyPut<TransactionService>(() => TransactionServiceImpl(), fenix: true);
    
  }
  
}