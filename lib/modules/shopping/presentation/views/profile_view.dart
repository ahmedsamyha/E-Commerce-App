import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:snapshop/modules/aouth/data/data_scourse/profile_cubit/profile_cubit.dart';
import 'package:snapshop/modules/aouth/data/data_scourse/profile_cubit/profile_stete.dart';
import 'package:snapshop/modules/aouth/data/models/user_data_model/LoginModel.dart';
import 'package:snapshop/modules/aouth/presentaion/views/login_view.dart';
import 'package:snapshop/modules/shopping/presentation/components/profile_shimmer.dart';
import 'package:snapshop/modules/shopping/presentation/views/address_view.dart';
import 'package:snapshop/modules/shopping/presentation/views/favorites_view.dart';

import '../../../../core/utility/constants/colors.dart';
import '../../../../core/utility/helper/local/helper_funcation.dart';
import '../components/custom_app_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

LoginModel? loginModel;

class _ProfileViewState extends State<ProfileView> {
  late bool isDark = HelperFunctions.isDarkMode(context);
  void changeTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var profileCubit = BlocProvider.of<ProfileCubit>(context);
          if (state is GetProfileLoadingState) {
            return const ProfileShimmer();
          } else if (state is GetProfileFailureState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AwesomeDialog(
                btnCancelColor: const Color(0xfff44369),
                btnOkColor: AppColors.primary,
                dialogBackgroundColor:
                    dark ? AppColors.darkBackground : AppColors.lightBackground,
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.topSlide,
                title: 'Error',
                desc: state.errorMessage,
                btnOkOnPress: () {},
              ).show();
            });
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/profile/profile.jpg')),
                    color: AppColors.kLightColor.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  profileCubit.loginModel!.userData!.name!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: height * .04,
                ),
                SizedBox(
                  height: height * .06,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.password_outlined,
                          size: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('Change Password'),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                SizedBox(
                  height: height * .06,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => const FavoritesView(),
                          transition: Transition.fade);
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.favorite_outlined,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('Favorites'),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                SizedBox(
                  height: height * .06,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => const AddressView());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/profile/address.png',
                          height: 20,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Text('Address'),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                SizedBox(
                  height: height * .06,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/profile/privacy.png',
                          height: 20,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Text('Privacy'),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
                SizedBox(
                  height: height * .06,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/profile/recent.png',
                          height: 20,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Text('Resent'),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  highlightColor: AppColors.accent,
                  onTap: () {
                    profileCubit.logOut();
                    Get.offAll(() => const LoginView());
                  },
                  child: Container(
                    height: height * .05,
                    width: width * .4,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primary.withOpacity(.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'LOGOUT',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Image.asset(
                          'assets/images/profile/logout2.png',
                          height: 28,
                          width: 28,
                        )

                        /* const Spacer(),*/
                        /*  const Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 18,
                        )*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
