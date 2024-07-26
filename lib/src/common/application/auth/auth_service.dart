import 'package:app_financeiro/src/common/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService{
  
  User? user;
  
  void init()async{
    //await Future.delayed(const Duration(seconds: 2));

    FirebaseAuth.instance.authStateChanges().listen((User? user){
      this.user = user;
      if(user == null){
        Get.offAllNamed(Routes.login);
      }else{
        Get.offAllNamed(Routes.mainNavigation);
      }
    });
  }
}