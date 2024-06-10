abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteSuccessState extends FavoriteState {}

class FavoriteFailureState extends FavoriteState {
  final String errorMessage;

  FavoriteFailureState({required this.errorMessage});
}
