import 'package:flutter/material.dart';
import 'package:snapshop/modules/shopping/presentation/components/profile_shimmer.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: ProfileShimmer(),
      ),
    );
  }
}
