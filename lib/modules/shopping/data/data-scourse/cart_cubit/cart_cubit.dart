import 'package:bloc/bloc.dart';
import 'package:snapshop/core/utility/constants/text_constants.dart';
import 'package:snapshop/core/utility/helper/network/dio_heper.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/cart_cubit/cart_state.dart';

import '../../models/product_model/ProductModel.dart';

class CartCubit extends Cubit<CartSate> {
  CartCubit(super.initialState, {required this.apiService});

  final ApiService apiService;
  ProductModel? productModel;
  Set<num> setCartID = {};
  List<ProductModel> cartProducts = [];

  Future<void> getCarts() async {
    cartProducts.clear();
    try {
      emit(GetCartLoadingState());
      var data = await apiService.get(
          endPoint: 'carts', lang: AppText.lang, token: AppText.token ?? '');
      for (var item in data['data']['cart_items']) {
        cartProducts.add(ProductModel.fromJson(item['product']));
        //set ID ************************
        setCartID.add(item['product']['id']);
        emit(GetCartSuccessState());
      }
      print(cartProducts.length);
    } on Exception catch (error) {
      emit(GetCartFailureState(errorMessage: error.toString()));
    }
  }

  Future<void> addOrRemoveCart({required num productID}) async {
    bool isAdded;
    // Update local state first
    if (setCartID.contains(productID)) {
      setCartID.remove(productID);
      isAdded = false;
      setCartID.clear();
    } else {
      setCartID.add(productID);
      isAdded = true;
      setCartID.clear();
    }
    emit(AddOrRemoveCartSuccessState());

    // Perform API call
    try {
      var data = await apiService.post(
          endPoint: 'carts',
          lang: AppText.lang,
          token: AppText.token ?? '',
          data: {'product_id': productID});
      await getCarts();
    } on Exception catch (error) {
      // Revert state change if API call fails
      if (isAdded) {
        setCartID.remove(productID);
      } else {
        setCartID.add(productID);
      }
      await getCarts();
      emit(AddOrRemoveCartFailureState(errorMessage: error.toString()));
    }
  }
}
