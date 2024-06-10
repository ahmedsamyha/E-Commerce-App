import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key, required this.text, required this.size});
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.purple,
      highlightColor: Colors.blue,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'Playball',
            fontSize: size,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
