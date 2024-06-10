import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:snapshop/core/utility/helper/network/dio_heper.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/categry_cubit/category_cubit.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/categry_cubit/category_state.dart';
import 'package:snapshop/modules/shopping/presentation/components/shimmer_cart.dart';

import '../components/custom_cart.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({
    super.key,
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: BlocProvider(
        create: (context) =>
            CategoryCubit(CategoryInitialState(), ApiService(dio: Dio()))
              ..getCategoryProducts(id: widget.id),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const ShimmerCart();
            } else if (state is CategoryFailureState) {
              print(state.errorMessage);
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: MasonryGridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemCount: BlocProvider.of<CategoryCubit>(context)
                      .categoryProducts
                      .length,
                  itemBuilder: (context, index) {
                    return CustomCart(
                      productModel: BlocProvider.of<CategoryCubit>(context)
                          .categoryProducts[index],
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}
