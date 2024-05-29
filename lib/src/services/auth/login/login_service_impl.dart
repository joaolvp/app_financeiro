import 'dart:developer';

import 'package:app_financeiro/src/model/user_model.dart';
import 'package:app_financeiro/src/services/auth/login/login_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginServiceImpl implements LoginService {
  @override
  Future<UserCredential> loginGoogle() async {
    //throw Exception('Erro ao realizar login com Google');
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
          
      return FirebaseAuth.instance.signInWithCredential(credential);
    }

    throw Exception('Erro ao realizar login com Google');
  }

  @override
  Future<UserModel> loginEmail(
      {required String email, required String password}) async {
    try {
      //throw Exception();
      final auth = FirebaseAuth.instance;
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        return UserModel(
          name: result.user!.displayName,
          email: result.user!.email,
          id: result.user!.uid,
        );
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      log('Error code: ${e.code}');
      throw e.code;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
