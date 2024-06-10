import 'package:flutter/material.dart';
import 'package:snapshop/core/utility/constants/colors.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key, required this.content});
  final String content;
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        child: SnackBar(
      content: Text(content),
      backgroundColor: AppColors.primary,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(24),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
