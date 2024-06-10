import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapshop/core/utility/constants/text_constants.dart';
import 'package:snapshop/core/utility/helper/network/dio_heper.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/home_cubit/home_state.dart';

import '../../models/product_model/ProductModel.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(super.initialState, {required this.apiService});
  final ApiService apiService;
  ProductModel? productModel;
  List<ProductModel> products = [];
  List<ProductModel> filterList = [];
  Future<void> getProducts() async {
    emit(HomeLoadingState());
    try {
      var data = await apiService.get(
          endPoint: 'products', lang: AppText.lang, token: AppText.token ?? '');
      for (var item in data['data']['data']) {
        products.add(ProductModel.fromJson(item));
      }
      emit(HomeSuccessState());
      print(products[0].name);
    } on Exception catch (error) {
      emit(HomeFailureState(errorMessage: error.toString()));
    }
  }

  void filterData({required String value}) {
    value.isNotEmpty
        ? filterList = products
            .where((element) =>
                element.name!.toLowerCase().startsWith(value.toLowerCase()))
            .toList()
        : filterList = [];
    emit(FilterSuccessState());
  }
}
