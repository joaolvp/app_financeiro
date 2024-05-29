import 'package:app_financeiro/src/model/user_model.dart';

abstract class RegisterService {
  Future<UserModel> register({
    String? name,
    required String email,
    required String password,
  });
}