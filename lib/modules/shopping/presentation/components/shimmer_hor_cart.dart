import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utility/constants/colors.dart';
import '../../../../core/utility/helper/local/helper_funcation.dart';

class ShimmerHorCart extends StatelessWidget {
  const ShimmerHorCart({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final dark = HelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => AspectRatio(
                aspectRatio: 8.8 / 3.5,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: dark
                        ? AppColors.darkBackground
                        : AppColors.lightBackground,
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
                      const SizedBox(height: 6),
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
                                child: SizedBox(
                                  height: height * .12,
                                  width: width * .3,
                                  child: Container(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 4,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Shimmer.fromColors(
                                baseColor: dark
                                    ? Colors.white.withOpacity(.2)
                                    : Colors.grey[300]!,
                                highlightColor: dark
                                    ? Colors.white.withOpacity(.3)
                                    : Colors.grey[100]!,
                                child: Container(
                                  width: 50,
                                  height: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 8, bottom: 8, top: 16, left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width * .33,
                              child: Shimmer.fromColors(
                                baseColor: dark
                                    ? Colors.white.withOpacity(.2)
                                    : Colors.grey[300]!,
                                highlightColor: dark
                                    ? Colors.white.withOpacity(.3)
                                    : Colors.grey[100]!,
                                child: Container(
                                  width: double.infinity,
                                  height: 18,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .04,
                            ),
                            SizedBox(
                              width: width * .33,
                              child: Shimmer.fromColors(
                                baseColor: dark
                                    ? Colors.white.withOpacity(.2)
                                    : Colors.grey[300]!,
                                highlightColor: dark
                                    ? Colors.white.withOpacity(.3)
                                    : Colors.grey[100]!,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                  width: double.infinity,
                                  height: 18,
                                ),
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
                                  topRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(8),
                                ),
                                color: Colors.grey[300],
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
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
          itemCount: 7),
    );
  }
}
