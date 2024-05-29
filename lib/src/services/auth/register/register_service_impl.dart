import 'dart:developer';

import 'package:app_financeiro/src/model/user_model.dart';
import 'package:app_financeiro/src/services/auth/register/register_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterServiceImpl implements RegisterService {  
  @override
  Future<UserModel> register({
    String? name,
    required String email,
    required String password,
  }) async {
    try {
      log('email: $email, senha: $password');
      final auth = FirebaseAuth.instance;
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user != null) {
        log(await auth.currentUser!.getIdToken(true) ?? 'nulo');

        await result.user!.updateDisplayName(name);
        return UserModel(
          name: auth.currentUser?.displayName,
          email: auth.currentUser?.email,
          id: auth.currentUser?.uid,
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
}
