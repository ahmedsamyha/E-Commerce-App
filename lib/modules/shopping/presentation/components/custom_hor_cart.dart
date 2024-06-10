import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/cart_cubit/cart_cubit.dart';

import '../../../../core/utility/constants/colors.dart';
import '../../../../core/utility/helper/local/helper_funcation.dart';
import '../../data/data-scourse/favorite_cubit/favorite_cubit.dart';
import '../../data/models/product_model/ProductModel.dart';
import '../views/product_details_view.dart';

class CustomHorCart extends StatefulWidget {
  const CustomHorCart({
    super.key,
    this.productModel,
    this.onTap,
  });
  final ProductModel? productModel;
  final void Function()? onTap;
  @override
  State<CustomHorCart> createState() => _CustomHorCartState();
}

class _CustomHorCartState extends State<CustomHorCart> {
  late bool inCart;
  late bool isFavorite;
  @override
  void initState() {
    super.initState();
    inCart = BlocProvider.of<CartCubit>(context)
        .setCartID
        .contains(widget.productModel!.id);

    isFavorite = BlocProvider.of<FavoriteCubit>(context)
        .setFavorite
        .contains(widget.productModel!.id);
  }
  // Change Cart ******************************

  void changIcon() {
    setState(() {
      inCart = !inCart;
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
        aspectRatio: 8.8 / 3.5,
        child: Container(
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
          child: Row(
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
                        child: SizedBox(
                          height: height * .12,
                          width: width * .3,
                          child: Image.network(
                            widget.productModel!.image ?? '',
                            fit: BoxFit.fill,
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
                        '${widget.productModel!.discount} % ',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            decoration: TextDecoration.lineThrough),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 8, top: 16),
                child: Column(
                  children: [
                    SizedBox(
                      width: width * .33,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('${widget.productModel!.name}',
                            maxLines: 3,
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
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SizedBox(
                        width: width * .3,
                        child: Text('${widget.productModel!.price}\$',
                            style: TextStyle(
                                color:
                                    dark ? AppColors.accent : AppColors.primary,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: height * .035,
                    width: width * .09,
                    decoration: BoxDecoration(
                      color: dark
                          ? Colors.white10
                          : AppColors.primary.withOpacity(.1),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(8)),
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            changeFavorite();
                            BlocProvider.of<FavoriteCubit>(context)
                                .addOrRemoveFavorite(
                                    productID: widget.productModel!.id!);
                          },
                          icon: (Icon(
                            Icons.favorite_outlined,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 20,
                          ))),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      changIcon();
                      cartCubit.addOrRemoveCart(
                          productID: widget.productModel!.id!);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(8)),
                          color: AppColors.primary.withOpacity(.5)),
                      child: inCart
                          ? const Icon(Icons.remove_shopping_cart_outlined)
                          : const Icon(Icons.add_shopping_cart_outlined),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
