import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapshop/core/utility/constants/text_constants.dart';
import 'package:snapshop/core/utility/helper/network/dio_heper.dart';
import 'package:snapshop/modules/aouth/data/data_scourse/register_cubit/resgister_state.dart';
import 'package:snapshop/modules/aouth/data/models/user_data_model/LoginModel.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(super.initialState, {required this.apiService});
  LoginModel? loginModel;
  final ApiService apiService;
  void createUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    // required File image,
  }) async {
    final formData = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      //'image': await MultipartFile.fromFile(image.path)
    };
    var response = await apiService.post(
        endPoint: 'register',
        lang: AppText.lang,
        token: AppText.token ?? '',
        data: FormData.fromMap(formData));
    loginModel = LoginModel.fromJson(response);
    if (loginModel!.status == true) {
      emit(RegisterSuccessSata());
      print(loginModel!.userData!.name);
      print(loginModel!.userData!.email);
      print(loginModel!.userData!.token);
      print(loginModel!.message);
      print(loginModel!.userData!.image);
    } else {
      emit(RegisterFailureSata(errorMessage: loginModel!.message));
      print(loginModel!.message);
    }
  }
}
