import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/cart_cubit/cart_cubit.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/cart_cubit/cart_state.dart';
import 'package:snapshop/modules/shopping/presentation/components/custom_hor_cart.dart';
import 'package:snapshop/modules/shopping/presentation/components/shimmer_hor_cart.dart';

import '../components/custom_app_bar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).getCarts();
    BlocProvider.of<CartCubit>(context).cartProducts.clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      body: BlocBuilder<CartCubit, CartSate>(
        builder: (context, state) {
          var cartCubit = BlocProvider.of<CartCubit>(context);
          if (state is GetCartLoadingState) {
            return const ShimmerHorCart();
          } else if (state is GetCartFailureState) {
            print(state.errorMessage);
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemBuilder: (context, index) => CustomHorCart(
              productModel: cartCubit.cartProducts[index],
              onTap: () {
                setState(() {
                  cartCubit.cartProducts[index].id.toString();
                });
              },
            ),
            itemCount: cartCubit.cartProducts.length,
          );
        },
      ),
    );
  }
}
