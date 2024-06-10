abstract class ProfileState {}

class GetProfileInitialState extends ProfileState {}

class GetProfileLoadingState extends ProfileState {}

class GetProfileSuccessState extends ProfileState {}

class GetProfileFailureState extends ProfileState {
  final String errorMessage;

  GetProfileFailureState({required this.errorMessage});
}

class LogoutLoadingState extends ProfileState {}

class LogoutSuccessState extends ProfileState {}

class LogoutFailureState extends ProfileState {
  final String errorMessage;

  LogoutFailureState({required this.errorMessage});
}
