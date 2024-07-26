import 'package:get/get.dart';
import 'value_transaction_controller.dart';

class ValueTransactionBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ValueTransactionController(transactionService: Get.find()));
    }
}