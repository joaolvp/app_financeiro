class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"^[A-Z]([a-zA-Z]|\.| |-|')+$");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Nome inválido.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    if (value != null && value.isEmpty) {
      return 'Esse campo não pode ser vazio.';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  static String? validatePassword(String? value){
    final condition = RegExp(r"""^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]).{8,}$""");
    if(value != null && value.isEmpty){
      return 'Esse campo não pode ser vazio.';
    }
    if(value != null && !condition.hasMatch(value)){
      return 'Senha inválida.';
    }
    return null;
  }

  static String? validateConfirmPassword(String first, String? second){
    if(first != second){
      return 'As senhas são diferentes.';
    }
    return null;
  }
}
