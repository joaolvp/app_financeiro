import 'dart:developer';

import 'package:app_financeiro/src/common/ui/dialog/dialog_mixin.dart';
import 'package:app_financeiro/src/common/ui/loader/loader_mixin.dart';
import 'package:app_financeiro/src/services/auth/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, DialogMixin{
  final LoginService _loginService;
  final loading = false.obs;
  var message = Rxn<MessageModel>();
  
  LoginController({required LoginService loginService}) : _loginService = loginService;

  @override
  void onInit(){
    super.onInit();
    loaderListener(loading);
    dialogListenner(message);
  }

  Future<void> loginGoogle() async{
    try {
      loading(true);
      await _loginService.loginGoogle();
      loading(false);
      log('Login com o Google efetuado com sucesso');
    }on Exception catch (e, s) {
      log('sadsajdos Exception: $e');
      log('StackTrace: $s');
      loading(false);
      message(MessageModel.error(title: 'Erro', message: 'Erro ao efetuar login com o Google', textButton: 'OK'));
    }
  }

  Future<void> loginEmail({required String email, required String password}) async{
    try {
      loading(true);
      await _loginService.loginEmail(email: email, password: password);
      loading(false);
      log('Login com o Google efetuado com sucesso');
    }on Exception catch (e, s) {
      loading(false);
      message(MessageModel.error(title: 'Erro', message: 'Erro ao efetuar login com o Google', textButton: 'OK'));
      log('Exception: $e');
      log('StackTrace: $s');
    }
  }

}