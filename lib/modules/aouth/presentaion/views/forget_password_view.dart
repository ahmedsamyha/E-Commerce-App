import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:snapshop/modules/aouth/presentaion/views/password_otp.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: (IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new))),
        title: const Text('Forget Password'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SvgPicture.asset('assets/images/login/forgotpassword.svg',
                  height: height * 0.38),
              SizedBox(
                height: height * .01,
              ),
              TextFormField(
                onChanged: (value) {},
                validator: (value) {
                  return null;
                },
                onFieldSubmitted: (value) {},
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'E-Mail'),
              ),
              SizedBox(
                height: height * .03,
              ),
              OutlinedButton(
                onPressed: () {
                  Get.to(() => const PasswordOtp(),
                      transition: Transition.leftToRightWithFade);
                },
                child: const Text('Send Verification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
