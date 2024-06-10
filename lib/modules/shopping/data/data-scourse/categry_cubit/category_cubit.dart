import 'package:bloc/bloc.dart';
import 'package:snapshop/core/utility/constants/text_constants.dart';
import 'package:snapshop/core/utility/helper/network/dio_heper.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/categry_cubit/category_state.dart';

import '../../models/product_model/ProductModel.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(super.initialState, this.apiService);

  final ApiService apiService;
  List<ProductModel> categoryProducts = [];
  Future<void> getCategoryProducts({required int id}) async {
    emit(CategoryLoadingState());
    try {
      var data = await apiService.get(
          endPoint: 'products?category_id=$id',
          lang: AppText.lang,
          token: AppText.token ?? '');
      for (var item in data['data']['data']) {
        categoryProducts.add(ProductModel.fromJson(item));
        emit(CategorySuccessState());
      }
    } on Exception catch (error) {
      emit(CategoryFailureState(errorMessage: error.toString()));
    }
  }
}
