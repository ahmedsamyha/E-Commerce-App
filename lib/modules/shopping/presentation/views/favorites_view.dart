import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapshop/modules/shopping/presentation/components/favorite_grid_view.dart';

import '../components/custom_app_bar.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: const FavoriteGridView(),
    );
  }
}
