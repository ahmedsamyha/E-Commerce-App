import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utility/constants/colors.dart';
import '../../../../core/utility/helper/local/helper_funcation.dart';

class ShimmerCart extends StatelessWidget {
  const ShimmerCart({super.key});

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MasonryGridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, index) => AspectRatio(
          aspectRatio: 8 / 11.8,
          child: Container(
            padding: const EdgeInsets.only(top: 6),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color:
                  dark ? AppColors.darkBackground : AppColors.lightBackground,
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
                        child: Shimmer.fromColors(
                          baseColor: dark
                              ? Colors.white.withOpacity(.2)
                              : Colors.grey[300]!,
                          highlightColor: dark
                              ? Colors.white.withOpacity(.3)
                              : Colors.grey[100]!,
                          child: AspectRatio(
                            aspectRatio: 9 / 9,
                            child: Container(
                              color: Colors.grey[300],
                              height: height * .15,
                              width: width * .40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 4,
                      child: Shimmer.fromColors(
                        baseColor: dark
                            ? Colors.white.withOpacity(.2)
                            : Colors.grey[300]!,
                        highlightColor: dark
                            ? Colors.white.withOpacity(.3)
                            : Colors.grey[100]!,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.grey[300],
                          ),
                          child: Container(
                            width: 40,
                            height: 12,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8, top: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: dark
                            ? Colors.white.withOpacity(.2)
                            : Colors.grey[300]!,
                        highlightColor: dark
                            ? Colors.white.withOpacity(.3)
                            : Colors.grey[100]!,
                        child: SizedBox(
                          width: width * .3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              height: 14,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Shimmer.fromColors(
                            baseColor: dark
                                ? Colors.white.withOpacity(.2)
                                : Colors.grey[300]!,
                            highlightColor: dark
                                ? Colors.white.withOpacity(.3)
                                : Colors.grey[100]!,
                            child: Container(
                              width: width * .3,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        child: Shimmer.fromColors(
                          baseColor: dark
                              ? Colors.white.withOpacity(.2)
                              : Colors.grey[300]!,
                          highlightColor: dark
                              ? Colors.white.withOpacity(.3)
                              : Colors.grey[100]!,
                          child: SizedBox(
                            width: width * .28,
                            child: Container(
                              height: 16,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: dark
                            ? Colors.white.withOpacity(.2)
                            : Colors.grey[300]!,
                        highlightColor: dark
                            ? Colors.white.withOpacity(.3)
                            : Colors.grey[100]!,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(8),
                            ),
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: 6,
      ),
    );
  }
}
