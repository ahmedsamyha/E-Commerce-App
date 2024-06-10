import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapshop/core/utility/constants/colors.dart';
import 'package:snapshop/core/utility/helper/local/helper_funcation.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/main_cubit/app_main_cubit.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/main_cubit/app_main_state.dart';

class AppMainView extends StatefulWidget {
  const AppMainView({super.key});

  @override
  State<AppMainView> createState() => _AppMainViewState();
}

class _AppMainViewState extends State<AppMainView> {
  @override
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    var appCubit = BlocProvider.of<AppMainCubit>(context);

    return BlocBuilder<AppMainCubit, AppMainState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
                backgroundColor:
                    dark ? AppColors.darkBackground : AppColors.lightBackground,
                indicatorColor: dark
                    ? AppColors.primary.withOpacity(.6)
                    : AppColors.primary.withOpacity(.3),
                elevation: 0,
                height: 64,
                labelTextStyle: MaterialStateProperty.all(
                    Theme.of(context).textTheme.headlineSmall),
                iconTheme: MaterialStateProperty.all(
                    IconThemeData(color: dark ? Colors.white : Colors.black))),
            child: NavigationBar(
              selectedIndex: appCubit.currentIndex,
              onDestinationSelected: (index) {
                appCubit.changeSelectedIndex(index: index);
              },
              destinations: [
                NavigationDestination(
                    icon: Icon(Icons.home_outlined,
                        color: dark ? Colors.white : Colors.black),
                    selectedIcon: const Icon(Icons.home),
                    label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.search_outlined,
                        color: dark ? Colors.white : Colors.black),
                    selectedIcon: const Icon(Icons.search),
                    label: 'Search'),
                NavigationDestination(
                    icon: Icon(Icons.shopping_cart_outlined,
                        color: dark ? Colors.white : Colors.black),
                    selectedIcon: const Icon(Icons.shopping_cart),
                    label: 'Cart'),
                NavigationDestination(
                    icon: Icon(Icons.person_outlined,
                        color: dark ? Colors.white : Colors.black),
                    selectedIcon: const Icon(Icons.person),
                    label: 'Profile'),
              ],
            ),
          ),
          body: appCubit.screens[appCubit.currentIndex],
        );
      },
    );
  }
}
