class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"^[A-Z]([a-zA-Z]|\.| |-|')+$");
    if (value != null && value.isEmpty) {
      return 'This field cannot be empty.';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Invalid name. Enter a valid name.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    if (value != null && value.isEmpty) {
      return 'This field cannot be empty.';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Invalid email. Enter a valid email address.';
    }
    return null;
  }

  static String? validatePassword(String? value){
    final condition = RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if(value != null && value.isEmpty){
      return 'This field cannot be empty.';
    }
    if(value != null && !condition.hasMatch(value)){
      return 'Invalid password. Enter a valid password.';
    }
    return null;
  }

  static String? validateConfirmPassword(String first, String? second){
    if(first != second){
      return 'The passwords are different.';
    }
    return null;
  }
}
