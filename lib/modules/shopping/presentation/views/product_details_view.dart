import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snapshop/core/utility/constants/colors.dart';
import 'package:snapshop/modules/shopping/data/data-scourse/cart_cubit/cart_cubit.dart';
import 'package:snapshop/modules/shopping/presentation/components/container_clip_path.dart';

import '../../../../core/utility/helper/local/helper_funcation.dart';
import '../../data/data-scourse/favorite_cubit/favorite_cubit.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.smallImages,
    required this.id,
  });
  String? image;
  final String? name;
  final String? description;
  final List<String>? smallImages;
  final num? price;
  final num? oldPrice;
  final num? discount;
  final num? id;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int counter = 1;
  late bool inCart;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    inCart = BlocProvider.of<CartCubit>(context).setCartID.contains(widget.id);
    isFavorite =
        BlocProvider.of<FavoriteCubit>(context).setFavorite.contains(widget.id);
  }
// Change Cart *************************

  void changeName() {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: ContainerCustomClipper(),
              child: Container(
                height: height * .33,
                width: width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.network(
                      '${widget.image}',
                      height: height * .18,
                      width: width * .6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, left: 24),
                      child: SizedBox(
                        height: height * .6,
                        width: width * .16,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => CustomSmallImage(
                                  image: widget.smallImages![index],
                                  onTap: () {
                                    setState(() {
                                      widget.image = widget.smallImages![index];
                                    });
                                  },
                                ),
                            separatorBuilder: (context, index) => const SizedBox(
                                  height: 8,
                                ),
                            itemCount: widget.smallImages!.length),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: height * .45,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * .7,
                            child: Text(
                              '${widget.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                          Container(
                            height: height * .05,
                            width: width * .12,
                            decoration: BoxDecoration(
                                color: dark
                                    ? Colors.white10
                                    : AppColors.primary.withOpacity(.1),
                                borderRadius: BorderRadius.circular(20)),
                            child: IconButton(
                                onPressed: () {
                                  changeFavorite();
                                  BlocProvider.of<FavoriteCubit>(context)
                                      .addOrRemoveFavorite(productID: widget.id!);
                                },
                                icon: (Icon(
                                  Icons.favorite_outlined,
                                  color: isFavorite ? Colors.red : Colors.white,
                                ))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.secondary.withOpacity(.8),
                            ),
                            child: Text(
                              '${widget.discount}% ',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            widget.price == widget.oldPrice
                                ? ''
                                : '${widget.oldPrice} \$',
                            style: TextStyle(
                                color:
                                    dark ? AppColors.accent : AppColors.primary,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            widget.price == widget.oldPrice
                                ? '${widget.price} \$'
                                : '  -  ${widget.price} \$',
                            style: TextStyle(
                                color:
                                    dark ? AppColors.accent : AppColors.primary,
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: height * .20,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              '${widget.description}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(height: 1.6),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
              child: SizedBox(
                height: height * .06,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * .36,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (counter > 1) {
                                  counter--;
                                }
                              });
                            },
                            mini: true,
                            backgroundColor: AppColors.primary,
                            child: const Icon(Icons.remove),
                          ),
                          Text('$counter'),
                          FloatingActionButton(
                            heroTag: '',
                            onPressed: () {
                              setState(() {
                                counter++;
                              });
                            },
                            mini: true,
                            backgroundColor: AppColors.primary,
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: width * .46,
                        child: OutlinedButton(
                            onPressed: () {
                              changeName();
                              BlocProvider.of<CartCubit>(context)
                                  .addOrRemoveCart(productID: widget.id!);
                            },
                            child: Center(
                              child: Text(
                                inCart ? 'Remove From Cart' : 'Add To Cart',
                                style: const TextStyle(fontSize: 16),
                              ),
                            )))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSmallImage extends StatelessWidget {
  const CustomSmallImage({super.key, required this.image, this.onTap});
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
          width: width * .16,
          height: width * .16,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200),
          child: Image.network(
            image,
            fit: BoxFit.fill,
          )),
    );
  }
}
