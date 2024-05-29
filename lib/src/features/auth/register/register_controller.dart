import 'dart:developer';

import 'package:app_financeiro/src/common/ui/dialog/dialog_mixin.dart';
import 'package:app_financeiro/src/common/ui/loader/loader_mixin.dart';
import 'package:app_financeiro/src/services/auth/register/register_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with LoaderMixin, DialogMixin {
  final RegisterService _registerService;
  final loading = false.obs;
  var message = Rxn<MessageModel>();

  RegisterController({required RegisterService registerService}) : _registerService = registerService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    dialogListenner(message);
  }
  

  void register({required String name, required String email, required String password}) async{
    //log('Sucesso no cadastro, nome: $name, e-mail: $email, senha: $password');

    try {
      loading(true);
      final user =
          await _registerService.register(name: name, email: email, password: password);
      log('usuario registrado');
      if (user.id != null) {
        loading(false);
        await const FlutterSecureStorage().write(key: 'CURRENT_USER', value: user.toJson());
        //_changeState(SignUpStateSuccess());
      } else {
        throw Exception();
      }
    } catch (e) {
      loading(false);
      if(e == "email-already-in-use"){
        message(MessageModel.error(title: 'Erro', message: 'Já existe uma conta vinculada a esse e-mail.', textButton: 'OK'));
      }else{
        message(MessageModel.error(title: 'Erro', message: 'Erro ao realizar cadastro.', textButton: 'OK'));
      }
      log('Entrou no exception do register controller catch (e)');
      log('Exception: $e');
      //_changeState(SignUpStateError(e.toString()));
    } 

  }
}