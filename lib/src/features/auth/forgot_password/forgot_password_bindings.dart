import 'package:get/get.dart';
import './forgot_password_controller.dart';

class ForgotPasswordBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ForgotPasswordController());
    }
}