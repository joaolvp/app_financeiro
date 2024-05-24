import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void teste()async{

    await Future.delayed(const Duration(seconds: 1));

    Get.toNamed(Routes.login);
  }
}