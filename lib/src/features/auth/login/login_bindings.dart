import 'package:app_financeiro/src/services/auth/login/login_service.dart';
import 'package:app_financeiro/src/services/auth/login/login_service_impl.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(LoginController(loginService: Get.find()));
    }
}