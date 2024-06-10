import 'package:flutter/material.dart';

import '../../data/models/category_model/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.onTap, required this.categoryModel});
  final void Function()? onTap;
  CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(44),
      highlightColor: Colors.red,
      child: Column(
        children: [
          Container(
            height: 44,
            width: 44,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(categoryModel.image),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            categoryModel.categoryName,
            style: const TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
