import 'dart:developer';

import 'package:get/get.dart';

class RegisterController extends GetxController {

  void register({required String name, required String email, required String password}){
    log('Sucesso no cadastro, nome: $name, e-mail: $email, senha: $password');

  }
}