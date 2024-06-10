import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/main_cubit/app_main_state.dart';
import 'package:snapshop/modules/shopping/presentation/views/cart_view.dart';
import 'package:snapshop/modules/shopping/presentation/views/home_view.dart';
import 'package:snapshop/modules/shopping/presentation/views/profile_view.dart';
import 'package:snapshop/modules/shopping/presentation/views/search_view.dart';

class AppMainCubit extends Cubit<AppMainState> {
  AppMainCubit(super.initialState);

  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const CartView(),
    const ProfileView(),
  ];
  int currentIndex = 0;

  void changeSelectedIndex({required int index}) {
    currentIndex = index;
    emit(AppMainSuccessState());
  }
}
