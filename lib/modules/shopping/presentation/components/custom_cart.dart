import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/cart_cubit/cart_cubit.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/favorite_cubit/favorite_cubit.dart';
import 'package:snapshop/modules/shopping/data/models/product_model/ProductModel.dart';
import 'package:snapshop/modules/shopping/presentation/views/product_details_view.dart';

import '../../../../core/utility/constants/colors.dart';
import '../../../../core/utility/helper/local/helper_funcation.dart';

class CustomCart extends StatefulWidget {
  const CustomCart({super.key, this.productModel});
  final ProductModel? productModel;

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  late bool isInCart;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isInCart = BlocProvider.of<CartCubit>(context)
        .setCartID
        .contains(widget.productModel!.id);

    isFavorite = BlocProvider.of<FavoriteCubit>(context)
        .setFavorite
        .contains(widget.productModel!.id);
  }
  // Change Cart *******************************

  void changeIcon() {
    setState(() {
      isInCart = !isInCart;
    });
  }

  // Change Favorites *************************
  void changeFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cartCubit = BlocProvider.of<CartCubit>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Get.to(() => ProductDetailsView(
              name: widget.productModel!.name,
              image: widget.productModel!.image,
              description: widget.productModel!.description,
              discount: widget.productModel!.discount,
              price: widget.productModel!.price,
              oldPrice: widget.productModel!.oldPrice,
              smallImages: widget.productModel!.images,
              id: widget.productModel!.id,
            ));
      },
      highlightColor: Colors.grey.withOpacity(.1),
      child: AspectRatio(
        aspectRatio: 8 / 11.8,
        child: Container(
          padding: const EdgeInsets.only(top: 6),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: dark ? AppColors.darkBackground : AppColors.lightBackground,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 6,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AspectRatio(
                          aspectRatio: 9 / 9,
                          child: SizedBox(
                            height: height * .15,
                            width: width * .40,
                            child: Image.network(
                              widget.productModel!.image ?? '',
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                  ),
                  Positioned(
                    top: 8,
                    left: 4,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.secondary.withOpacity(.8),
                      ),
                      child: Text(
                        '${widget.productModel!.discount}% ',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 2, bottom: 8, top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * .27,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(widget.productModel!.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: dark ? Colors.white : Colors.black,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    Container(
                      height: height * .04,
                      width: width * .09,
                      decoration: BoxDecoration(
                          color: dark
                              ? Colors.white10
                              : AppColors.primary.withOpacity(.07),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topRight: Radius.circular(16))),
                      child: IconButton(
                          icon: isFavorite
                              ? const Icon(Icons.favorite_outlined,
                                  color: Colors.red, size: 20)
                              : const Icon(Icons.favorite_outline,
                                  color: Colors.grey, size: 20),
                          onPressed: () {
                            changeFavorite();
                            BlocProvider.of<FavoriteCubit>(context)
                                .addOrRemoveFavorite(
                                    productID: widget.productModel!.id!);
                          }),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      width: width * .3,
                      child: Text("\$ ${widget.productModel!.price} ",
                          style: TextStyle(
                              color:
                                  dark ? AppColors.accent : AppColors.primary,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      // Change the icon immediately
                      changeIcon();
                      // Perform the API call
                      cartCubit.addOrRemoveCart(
                        productID: widget.productModel!.id!,
                      );
                    },
                    child: Container(
                      height: height * .033,
                      width: width * .08,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(8)),
                          color: AppColors.primary.withOpacity(.5)),
                      child: isInCart
                          ? const Icon(Icons.remove_shopping_cart_outlined)
                          : const Icon(Icons.add_shopping_cart_outlined),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
