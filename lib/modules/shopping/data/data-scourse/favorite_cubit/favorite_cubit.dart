import 'package:bloc/bloc.dart';
import 'package:snapshop/core/utility/constants/text_constants.dart';
import 'package:snapshop/core/utility/helper/network/dio_heper.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/favorite_cubit/favorite_sate.dart';

import '../../models/product_model/ProductModel.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(super.initialState, {required this.apiService});
  final ApiService apiService;
  ProductModel? productModel;
  Set<num> setFavorite = {};
  List<ProductModel> favoritesList = [];

  Future<void> getFavorites() async {
    favoritesList.clear();
    try {
      emit(FavoriteLoadingState());
      var data = await apiService.get(
          endPoint: 'favorites',
          lang: AppText.lang,
          token: AppText.token ?? "");
      for (var item in data['data']['data']) {
        favoritesList.add(ProductModel.fromJson(item['product']));
        setFavorite.add(item['product']['id']);
        emit(FavoriteSuccessState());
      }
      print('favorites : ${setFavorite.length}');
    } on Exception catch (error) {
      emit(FavoriteFailureState(errorMessage: error.toString()));
    }
  }

  Future<void> addOrRemoveFavorite({required num productID}) async {
    bool addFavorite;
    if (setFavorite.contains(productID)) {
      setFavorite.remove(productID);
      addFavorite = false;
    } else {
      setFavorite.add(productID);
      addFavorite = true;
    }
    emit(FavoriteSuccessState());
    try {
      var data = await apiService.post(
          endPoint: 'favorites',
          lang: AppText.lang,
          token: AppText.token ?? "",
          data: {'product_id': productID});
      await getFavorites();
    } on Exception {
      if (addFavorite) {
        setFavorite.remove(productID);
      } else {
        setFavorite.add(productID);
      }
      await getFavorites();
    }
  }
}
