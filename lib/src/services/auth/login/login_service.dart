import 'package:app_financeiro/src/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginService {
  Future<UserCredential> loginGoogle();
  Future<UserModel> loginEmail({
    required String email,
    required String password 
  });
  Future<void> logout();
}