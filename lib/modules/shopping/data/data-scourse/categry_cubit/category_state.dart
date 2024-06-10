abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategorySuccessState extends CategoryState {}

class CategoryFailureState extends CategoryState {
  final String errorMessage;

  CategoryFailureState({required this.errorMessage});
}
