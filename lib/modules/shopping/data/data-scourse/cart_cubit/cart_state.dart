abstract class CartSate {}

class GetCartInitialState extends CartSate {}

class GetCartLoadingState extends CartSate {}

class GetCartSuccessState extends CartSate {}

class GetCartFailureState extends CartSate {
  final String errorMessage;

  GetCartFailureState({required this.errorMessage});
}

class AddOrRemoveCartInitialState extends CartSate {}

class AddOrRemoveCartSuccessState extends CartSate {}

class AddOrRemoveCartLoadingState extends CartSate {}

class AddOrRemoveCartFailureState extends CartSate {
  final String errorMessage;

  AddOrRemoveCartFailureState({required this.errorMessage});
}
