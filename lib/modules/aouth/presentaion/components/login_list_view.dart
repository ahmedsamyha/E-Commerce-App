import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:snapshop/core/utility/constants/colors.dart';
import 'package:snapshop/core/utility/helper/network/dio_heper.dart';
import 'package:snapshop/modules/aouth/data/data_scourse/login_cubit/login_cubit.dart';
import 'package:snapshop/modules/aouth/data/data_scourse/login_cubit/login_state.dart';
import 'package:snapshop/modules/aouth/presentaion/components/logo_text.dart';
import 'package:snapshop/modules/shopping/presentation/views/app_main_view.dart';

import '../../../../core/utility/helper/local/helper_funcation.dart';
import '../../data/models/user_data_model/user_data_model.dart';
import '../views/forget_password_view.dart';
import '../views/register_view.dart';

class LoginListView extends StatefulWidget {
  const LoginListView({
    super.key,
  });

  @override
  State<LoginListView> createState() => _LoginListViewState();
}

class _LoginListViewState extends State<LoginListView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  late bool showPassword = true;
  void passwordState() {
    showPassword = !showPassword;
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final dark = HelperFunctions.isDarkMode(context);

    UserDataModel? userDataModel;
    return BlocProvider(
      create: (context) => LoginCubit(
        LoginInitialSata(),
        apiService: ApiService(dio: Dio()),
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingSata) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoginFailureSata) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (state.errorMessage ==
                  'This credentials does not meet any of our records, please make sure you have entered the right credentials') {
                AwesomeDialog(
                  btnCancelColor: const Color(0xfff44369),
                  btnOkColor: AppColors.primary,
                  dialogBackgroundColor: dark
                      ? AppColors.darkBackground
                      : AppColors.lightBackground,
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.topSlide,
                  title: 'Error',
                  desc: 'No user found for that email.',
                  btnOkOnPress: () {},
                ).show();
              } else if (state.errorMessage == 'Please enter email address') {
                AwesomeDialog(
                  dialogBackgroundColor: dark
                      ? AppColors.darkBackground
                      : AppColors.lightBackground,
                  btnCancelColor: const Color(0xfff44369),
                  btnOkColor: AppColors.primary,
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.topSlide,
                  title: 'Error',
                  desc: 'Please Enter Your Email And Password.',
                  btnOkOnPress: () {},
                ).show();
              } else {
                AwesomeDialog(
                  context: context,
                  btnCancelColor: const Color(0xfff44369),
                  btnOkColor: AppColors.primary,
                  dialogBackgroundColor: dark
                      ? AppColors.darkBackground
                      : AppColors.lightBackground,
                  dialogType: DialogType.error,
                  animType: AnimType.topSlide,
                  title: 'Error',
                  desc: state.errorMessage.toString(),
                  btnOkOnPress: () {},
                ).show();
              }
            });
            // ignore: avoid_print
            print(state.errorMessage);
          } else if (state is LoginSuccessSata) {
            Get.offAll(() => const AppMainView(), transition: Transition.zoom);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: height * .04,
                  ),
                  const Center(child: LogoText(text: 'LOGIN', size: 30)),
                  SvgPicture.asset(
                    'assets/images/login/login1.svg',
                    height: height * 0.37,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'E-Mail'),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your password';
                      }
                      return null;
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordState();
                            });
                          },
                          icon: showPassword
                              ? const Icon(
                                  Icons.remove_red_eye_outlined,
                                )
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: AppColors.primary,
                                ),
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          Text(
                            'Remember Me',
                            style: Theme.of(context).textTheme.labelSmall,
                          )
                        ],
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const ForgetPasswordView(),
                                transition: Transition.leftToRightWithFade);
                          },
                          child: const Text('Forget Password ?'))
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    child: const Text('LOGIN'),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Get.to(() => const RegisterView(),
                            transition: Transition.zoom,
                            duration: const Duration(milliseconds: 400));
                      },
                      child: const Text('Create Account'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
