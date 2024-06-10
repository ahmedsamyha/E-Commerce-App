import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utility/constants/colors.dart';
import '../../data/models/category_model/category_model.dart';
import '../views/category_view.dart';
import 'category_item.dart';
import 'container_clip_path.dart';

class CustomClipPath extends StatefulWidget {
  const CustomClipPath({super.key});

  @override
  State<CustomClipPath> createState() => _CustomClipPathState();
}

class _CustomClipPathState extends State<CustomClipPath> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<CategoryModel> categories = [
      CategoryModel(
          image: 'assets/images/categories/technology1.png',
          id: 44,
          categoryName: 'Electronics'),
      CategoryModel(
          image: 'assets/images/categories/sport1.png',
          id: 42,
          categoryName: 'Sports'),
      CategoryModel(
          image: 'assets/images/categories/clothe3.png',
          id: 46,
          categoryName: 'Clothes'),
      CategoryModel(
          image: 'assets/images/categories/corona1.png',
          id: 43,
          categoryName: 'Corona'),
      CategoryModel(
          image: 'assets/images/categories/light3.png',
          id: 40,
          categoryName: 'Lighting'),
    ];
    return ClipPath(
      clipper: ContainerCustomClipper(),
      child: Container(
        padding: const EdgeInsets.all(0),
        height: height * .26,
        color: AppColors.primary,
        child: Stack(
          children: [
            Positioned(
              bottom: -190,
              right: -280,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.1),
                    borderRadius: BorderRadius.circular(400)),
                height: 400,
                width: 400,
              ),
            ),
            const Positioned(
              left: 30,
              top: 70,
              child: Column(
                children: [
                  Text(
                    'Popular Category',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 24,
              bottom: 40,
              child: SizedBox(
                height: 70,
                width: width,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CategoryItem(
                          onTap: () {
                            Get.to(
                                (CategoryView(
                                  name: categories[index].categoryName,
                                  id: categories[index].id,
                                )),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(milliseconds: 300));
                          },
                          categoryModel: categories[index],
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: width * .05,
                        ),
                    itemCount: categories.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
