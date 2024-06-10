import 'package:flutter/material.dart';

import '../components/register_list_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: RegisterListView(),
      ),
    );
  }
}
