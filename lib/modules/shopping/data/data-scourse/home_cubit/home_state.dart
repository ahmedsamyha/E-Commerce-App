abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeFailureState extends HomeState {
  final String errorMessage;

  HomeFailureState({required this.errorMessage});
}

class FilterSuccessState extends HomeState {}
