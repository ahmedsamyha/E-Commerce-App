import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        const Center(
          child: SizedBox(
              height: 50,
              width: 50,
              child: Image(
                image: AssetImage('assets/images/bag/shopping_cart.png'),
                fit: BoxFit.fill,
              )),
        ),
        const SizedBox(
          width: 12,
        ),
        Shimmer.fromColors(
            baseColor: Colors.purple,
            highlightColor: Colors.blue,
            child: const Text(
              'SnapShop',
              style: TextStyle(
                  fontFamily: 'Playball',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
