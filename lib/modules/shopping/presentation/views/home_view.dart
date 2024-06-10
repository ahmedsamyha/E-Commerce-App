import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snapshop/core/utility/constants/colors.dart';
import 'package:snapshop/modules/shopping/presentation/components/custom_clip_path.dart';
import 'package:snapshop/modules/shopping/presentation/components/home_list_items.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.primary),
        title: Padding(
          padding: const EdgeInsets.only(left: 12, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good day for shopping at',
                style: TextStyle(
                    color: Colors.white.withOpacity(.9),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'SnapShop',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24, top: 8),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: const Column(
        children: [CustomClipPath(), Expanded(child: HomeListItems())],
      ),
    );
  }
}
