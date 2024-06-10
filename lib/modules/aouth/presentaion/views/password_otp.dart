import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapshop/core/utility/constants/colors.dart';
import 'package:snapshop/core/utility/helper/local/helper_funcation.dart';
import 'package:snapshop/modules/aouth/presentaion/views/reset_password_view.dart';

import '../components/otp_form_field.dart';

class PasswordOtp extends StatefulWidget {
  const PasswordOtp({super.key});

  @override
  State<PasswordOtp> createState() => _PasswordOtpState();
}

class _PasswordOtpState extends State<PasswordOtp> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        leading: (IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new))),
        title: const Text('Verification Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: height * .03,
            ),
            Center(
              child: Container(
                  height: 200,
                  width: 150,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: dark
                        ? AppColors.kLightColor.withOpacity(.1)
                        : AppColors.primary.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/images/login/email.png')),
            ),
            /*  const SizedBox(
              height: 16,
            ),
            Center(
                child: Text(
              'Verification Code',
              style: Theme.of(context).textTheme.titleLarge,
            )),*/
            SizedBox(
              height: height * .03,
            ),
            Center(
              child: Text(
                'We have to sent the code verification to',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Text(
                'ahmedsamy250@gmail.com',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            SizedBox(
              height: height * .04,
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtpTextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return null;
                    },
                  ),
                  OtpTextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return null;
                    },
                  ),
                  OtpTextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return null;
                    },
                  ),
                  OtpTextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            OutlinedButton(
                onPressed: () {
                  Get.to(() => const ResetPasswordView(),
                      transition: Transition.leftToRightWithFade);
                },
                child: const Text('Verify')),
            const SizedBox(
              height: 4,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.01),
              width: width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t receive the code ?',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Resend',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
