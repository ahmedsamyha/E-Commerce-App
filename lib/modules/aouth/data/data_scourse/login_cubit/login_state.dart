abstract class LoginState {}

class LoginInitialSata extends LoginState {}

class LoginLoadingSata extends LoginState {}

class LoginSuccessSata extends LoginState {}

class LoginFailureSata extends LoginState {
  final String? errorMessage;

  LoginFailureSata({required this.errorMessage});
}
