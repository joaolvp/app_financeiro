import 'package:app_financeiro/src/services/auth/register/register_service.dart';
import 'package:app_financeiro/src/services/auth/register/register_service_impl.dart';
import 'package:get/get.dart';
import 'register_controller.dart';

class RegisterBindings implements Bindings {
    @override
    void dependencies() {
      Get.put<RegisterService>(RegisterServiceImpl());
      Get.put(RegisterController(registerService: Get.find()));
    }
}