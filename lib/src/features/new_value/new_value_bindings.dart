import 'package:get/get.dart';
import './new_value_controller.dart';

class NewValueBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(NewValueController(transactionService: Get.find()));
    }
}