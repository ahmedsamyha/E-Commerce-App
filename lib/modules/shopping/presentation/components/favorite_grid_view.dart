import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/favorite_cubit/favorite_cubit.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/favorite_cubit/favorite_sate.dart';
import 'package:snapshop/modules/shopping/presentation/components/shimmer_cart.dart';

import '../../../../core/utility/constants/colors.dart';
import '../../../../core/utility/helper/local/helper_funcation.dart';
import 'custom_cart.dart';

class FavoriteGridView extends StatefulWidget {
  const FavoriteGridView({super.key});

  @override
  State<FavoriteGridView> createState() => _FavoriteGridViewState();
}

class _FavoriteGridViewState extends State<FavoriteGridView> {
  @override
  void initState() {
    BlocProvider.of<FavoriteCubit>(context).getFavorites();
    BlocProvider.of<FavoriteCubit>(context).favoritesList.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoadingState) {
          return const ShimmerCart();
        } else if (state is FavoriteFailureState) {
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
              itemCount:
                  BlocProvider.of<FavoriteCubit>(context).favoritesList.length,
              itemBuilder: (context, index) {
                return CustomCart(
                  productModel: BlocProvider.of<FavoriteCubit>(context)
                      .favoritesList[index],
                );
              }),
        );
      },
    );
  }
}
