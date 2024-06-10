import 'package:bloc/bloc.dart';
import 'package:snapshop/core/utility/constants/text_constants.dart';
import 'package:snapshop/core/utility/helper/network/dio_heper.dart';
import 'package:snapshop/modules/aouth/data/data_scourse/login_cubit/login_state.dart';
import 'package:snapshop/modules/aouth/data/models/user_data_model/LoginModel.dart';

import '../../../../../core/utility/helper/local/cash_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(super.initialState, {required this.apiService});

  LoginModel? loginModel;
  final ApiService apiService;

  void userLogin({
    required String email,
    required String password,
  }) async {
    var response = await apiService.post(
        endPoint: 'login',
        token: AppText.token ?? '',
        lang: AppText.lang,
        data: {
          'email': email,
          'password': password,
        });
    loginModel = LoginModel.fromJson(response);
    // var data = jsonDecode(response.data);
    if (loginModel!.status == true) {
      await CashHelper.saveDate(
          key: 'token', value: loginModel!.userData!.token);
      AppText.token = loginModel!.userData!.token;
      emit(LoginSuccessSata());
      print(loginModel!.userData!.name);
      print(loginModel!.userData!.email);
      print(loginModel!.userData!.token);
      print(loginModel!.message);
      print(loginModel!.userData!.image);
    } else {
      emit(LoginFailureSata(errorMessage: loginModel!.message));
      print(loginModel!.message);
    }
  }
}
