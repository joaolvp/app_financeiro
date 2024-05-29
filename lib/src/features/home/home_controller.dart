import 'package:app_financeiro/src/services/auth/login/login_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LoginService _loginService;

  HomeController({required LoginService loginService}) : _loginService = loginService;

  void logout () async{
    await _loginService.logout();
  }
}