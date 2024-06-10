import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snapshop/core/utility/theme_data/app_theme.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/favorite_cubit/favorite_cubit.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/favorite_cubit/favorite_sate.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/main_cubit/app_main_cubit.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/main_cubit/app_main_state.dart';
import 'package:snapshop/modules/splash/splash_view.dart';

import 'core/utility/constants/text_constants.dart';
import 'core/utility/helper/local/bloc_observer.dart';
import 'core/utility/helper/local/cash_helper.dart';
import 'core/utility/helper/network/dio_heper.dart';
import 'modules/aouth/data/data_scourse/profile_cubit/profile_cubit.dart';
import 'modules/aouth/data/data_scourse/profile_cubit/profile_stete.dart';
import 'modules/shopping/data/data-scourse/cart_cubit/cart_cubit.dart';
import 'modules/shopping/data/data-scourse/cart_cubit/cart_state.dart';
import 'modules/shopping/data/data-scourse/home_cubit/home_cubit.dart';
import 'modules/shopping/data/data-scourse/home_cubit/home_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  AppText.token = CashHelper.getData(key: 'token');
  MyBlocObserver();

  runApp(const SnapShop());
}

class SnapShop extends StatelessWidget {
  const SnapShop({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
            ProfileCubit(GetProfileInitialState(), ApiService(dio: Dio()))
              ..getProfile()),
        BlocProvider(
            create: (context) => HomeCubit(HomeInitialState(),
                apiService: ApiService(dio: Dio()))
              ..getProducts()),
        BlocProvider(create: (context) => AppMainCubit(AppMainInitialState())),
        BlocProvider(
            create: (context) => CartCubit(GetCartInitialState(),
                apiService: ApiService(dio: Dio()))),
        BlocProvider(
            create: (context) => FavoriteCubit(FavoriteInitialState(),
                apiService: ApiService(dio: Dio()))),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const SplashView(),
      ),
    );
  }
}
