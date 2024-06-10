import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/home_cubit/home_cubit.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/home_cubit/home_state.dart';

import 'custom_cart.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BlocProvider.of<HomeCubit>(context).filterList.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: height * .19),
                child: Image.asset(
                  'assets/images/sights/empty_search.png',
                  height: height * .2,
                  width: width * .6,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: MasonryGridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount:
                        BlocProvider.of<HomeCubit>(context).filterList.length,
                    itemBuilder: (context, index) {
                      return CustomCart(
                        productModel: BlocProvider.of<HomeCubit>(context)
                            .filterList[index],
                      );
                    }),
              );
      },
    );
  }
}
