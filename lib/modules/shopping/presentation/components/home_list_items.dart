import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:snapshop/modules/shopping/presentation/components/poductes_grid_view.dart';

import '../../../../core/utility/constants/colors.dart';
import '../../../../core/utility/constants/constants.dart';

class HomeListItems extends StatelessWidget {
  const HomeListItems({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        AspectRatio(
          aspectRatio: 4 / 2,
          child: SizedBox(
            height: height * .23,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      KImages.banners[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
              itemCount: KImages.banners.length,
              autoplay: true,
              viewportFraction: 1,
              scale: .9,
              pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      activeColor: AppColors.primary)),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const ProductsGridView(),
      ],
    );
  }
}
