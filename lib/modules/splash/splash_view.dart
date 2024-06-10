import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snapshop/core/utility/constants/colors.dart';
import 'package:snapshop/core/utility/constants/text_constants.dart';
import 'package:snapshop/core/utility/helper/local/helper_funcation.dart';
import 'package:snapshop/core/utility/theme_data/custom_theme/text_theme.dart';
import 'package:snapshop/modules/aouth/presentaion/views/login_view.dart';
import 'package:snapshop/modules/shopping/presentation/views/app_main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(
          () => AppText.token != null && AppText.token != ''
              ? const AppMainView()
              : const LoginView(),
          transition: Transition.native,
          duration: const Duration(milliseconds: 400));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final dark = HelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:
              dark ? AppColors.darkBackground : AppColors.lightBackground,
          statusBarIconBrightness: dark ? Brightness.light : Brightness.dark,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .28,
            ),
            Center(
              child: SizedBox(
                  height: width * .20,
                  width: width * .20,
                  child: const Image(
                    image: AssetImage('assets/images/bag/shopping_cart.png'),
                    fit: BoxFit.fill,
                  )),
            ),
            Shimmer.fromColors(
                baseColor: Colors.purple,
                highlightColor: Colors.blue,
                child: Text(
                  'SnapShop',
                  style: AppTextTheme.splashTitle,
                )),
            SizedBox(
              height: height * .43,
            ),
            Text('Easy Online Shopping',
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 4,
            )
          ],
        ),
      ),
    );
  }
}
