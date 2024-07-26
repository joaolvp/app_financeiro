import 'package:get/get.dart';
import './main_navigation_controller.dart';

class MainNavigationBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(MainNavigationController());
    }
}