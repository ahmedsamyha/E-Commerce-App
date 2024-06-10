import 'package:bloc/bloc.dart';
import 'package:snapshop/core/utility/constants/text_constants.dart';
import 'package:snapshop/core/utility/helper/network/dio_heper.dart';
import 'package:snapshop/modules/aouth/data/data_scourse/profile_cubit/profile_stete.dart';
import 'package:snapshop/modules/aouth/data/models/user_data_model/LoginModel.dart';

import '../../../../../core/utility/helper/local/cash_helper.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(super.initialState, this.apiService);

  final ApiService apiService;
  LoginModel? loginModel;
  Map<String, dynamic> profileData = {};

  Future<void> getProfile() async {
    emit(GetProfileLoadingState());
    try {
      var data = await apiService.get(
          endPoint: 'profile', lang: AppText.lang, token: AppText.token ?? '');
      loginModel = LoginModel.fromJson(data);
      emit(GetProfileSuccessState());
      print(loginModel!.userData!.name);
      print(loginModel!.userData!.image);
    } on Exception catch (error) {
      emit(GetProfileFailureState(errorMessage: error.toString()));
    }
  }

  Future<void> logOut() async {
    emit(LogoutLoadingState());
    var data = await apiService.post(
        endPoint: 'logout',
        lang: AppText.lang,
        token: AppText.token ?? '',
        data: {'fcm_token': AppText.token});
    await CashHelper.deleteDataItem(key: 'token');
    emit(LogoutSuccessState());
  }
}
