import 'dart:developer';

import 'package:app_financeiro/src/services/auth/login/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final LoginService _loginService;
  Rx<String> nameUser = ''.obs;
  Rx<String> photoUser = ''.obs;
  Rx<String> emailUser = ''.obs;
  Rx<String> providerIdUser = ''.obs;


  ProfileController({required LoginService loginService}) : _loginService = loginService;
  
  @override
  void onInit() {
    getInfo();
    super.onInit();
  }

  getInfo(){
    log(FirebaseAuth.instance.currentUser!.providerData.first.providerId);
    log(FirebaseAuth.instance.currentUser!.providerData.first.email!);
    log(FirebaseAuth.instance.currentUser!.providerData.toString());
    nameUser.value = FirebaseAuth.instance.currentUser!.displayName ?? '';
    photoUser.value = FirebaseAuth.instance.currentUser!.photoURL ?? '';
    emailUser.value = FirebaseAuth.instance.currentUser!.providerData.first.email ?? '';
    providerIdUser.value = FirebaseAuth.instance.currentUser!.providerData.first.providerId;
    
  }
  

  void logout() async {
    await _loginService.logout();
  }
}