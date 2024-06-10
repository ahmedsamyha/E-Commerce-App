abstract class RegisterState {}

class RegisterInitialSata extends RegisterState {}

class RegisterLoadingSata extends RegisterState {}

class RegisterSuccessSata extends RegisterState {}

class RegisterFailureSata extends RegisterState {
  final String? errorMessage;

  RegisterFailureSata({required this.errorMessage});
}
