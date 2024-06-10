import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utility/helper/local/helper_funcation.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: dark ? Colors.white.withOpacity(.2) : Colors.grey[300]!,
            highlightColor:
                dark ? Colors.white.withOpacity(.3) : Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.all(16),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
          Shimmer.fromColors(
            baseColor: dark ? Colors.white.withOpacity(.2) : Colors.grey[300]!,
            highlightColor:
                dark ? Colors.white.withOpacity(.3) : Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[300],
              ),
              width: width * .5,
              height: height * .03,
            ),
          ),
          SizedBox(
            height: height * .04,
          ),
          Shimmer.fromColors(
            baseColor: dark ? Colors.white.withOpacity(.2) : Colors.grey[300]!,
            highlightColor:
                dark ? Colors.white.withOpacity(.3) : Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              height: height * .045,
            ),
          ),
          SizedBox(
            height: height * .03,
          ),
          Shimmer.fromColors(
            baseColor: dark ? Colors.white.withOpacity(.2) : Colors.grey[300]!,
            highlightColor:
                dark ? Colors.white.withOpacity(.3) : Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              height: height * .045,
            ),
          ),
          SizedBox(
            height: height * .03,
          ),
          Shimmer.fromColors(
            baseColor: dark ? Colors.white.withOpacity(.2) : Colors.grey[300]!,
            highlightColor:
                dark ? Colors.white.withOpacity(.3) : Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              height: height * .045,
            ),
          ),
          SizedBox(
            height: height * .03,
          ),
          Shimmer.fromColors(
            baseColor: dark ? Colors.white.withOpacity(.2) : Colors.grey[300]!,
            highlightColor:
                dark ? Colors.white.withOpacity(.3) : Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              height: height * .045,
            ),
          ),
          SizedBox(
            height: height * .03,
          ),
          Shimmer.fromColors(
            baseColor: dark ? Colors.white.withOpacity(.2) : Colors.grey[300]!,
            highlightColor:
                dark ? Colors.white.withOpacity(.3) : Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              height: height * .045,
            ),
          ),
          SizedBox(
            height: height * .08,
          ),
          Shimmer.fromColors(
            baseColor: dark ? Colors.white.withOpacity(.2) : Colors.grey[300]!,
            highlightColor:
                dark ? Colors.white.withOpacity(.3) : Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey[300],
              ),
              width: width * .4,
              height: height * .045,
            ),
          ),
        ],
      ),
    );
  }
}
