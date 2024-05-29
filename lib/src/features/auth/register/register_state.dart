abstract class Register {

}

class RegisterInitial extends Register{

}

class RegisterLoading extends Register{
  
}

class RegisterSuccess extends Register{
  
}

class RegisterError extends Register{
  final String message;

  RegisterError(this.message);
}