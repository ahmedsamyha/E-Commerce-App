import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/favorite_cubit/favorite_cubit.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/home_cubit/home_cubit.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/home_cubit/home_state.dart';
import 'package:snapshop/modules/shopping/presentation/components/shimmer_cart.dart';

import '../../../../core/utility/constants/colors.dart';
import '../../../../core/utility/helper/local/helper_funcation.dart';
import '../../data/data-scourse/cart_cubit/cart_cubit.dart';
import 'custom_cart.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({super.key});

  @override
  State<ProductsGridView> createState() => _ProductsGridViewState();
}

class _ProductsGridViewState extends State<ProductsGridView> {
  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          BlocProvider.of<CartCubit>(context).getCarts();
          BlocProvider.of<CartCubit>(context).cartProducts.clear();
          BlocProvider.of<FavoriteCubit>(context).getFavorites();
          BlocProvider.of<FavoriteCubit>(context).favoritesList.clear();
          return const ShimmerCart();
        } else if (state is HomeFailureState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AwesomeDialog(
              btnCancelColor: const Color(0xfff44369),
              btnOkColor: AppColors.primary,
              dialogBackgroundColor:
                  dark ? AppColors.darkBackground : AppColors.lightBackground,
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.topSlide,
              title: 'Error',
              desc: state.errorMessage,
              btnOkOnPress: () {},
            ).show();
          });
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: MasonryGridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemCount: BlocProvider.of<HomeCubit>(context).products.length,
              itemBuilder: (context, index) {
                return CustomCart(
                  productModel:
                      BlocProvider.of<HomeCubit>(context).products[index],
                );
              }),
        );
      },
    );
  }
}
