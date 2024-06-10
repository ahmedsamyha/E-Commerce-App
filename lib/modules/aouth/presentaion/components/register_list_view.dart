import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snapshop/core/utility/constants/colors.dart';
import 'package:snapshop/core/utility/helper/local/helper_funcation.dart';
import 'package:snapshop/core/utility/helper/network/dio_heper.dart';
import 'package:snapshop/modules/aouth/data/data_scourse/register_cubit/register_cubit.dart';
import 'package:snapshop/modules/aouth/data/data_scourse/register_cubit/resgister_state.dart';
import 'package:snapshop/modules/shopping/presentation/views/app_main_view.dart';

import 'logo_text.dart';

class RegisterListView extends StatefulWidget {
  const RegisterListView({
    super.key,
  });

  @override
  State<RegisterListView> createState() => _RegisterListViewState();
}

class _RegisterListViewState extends State<RegisterListView> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  File? file;
  getImage() async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.gallery);
/*// Capture a photo.
    final XFile? imageCamera =
        await picker.pickImage(source: ImageSource.camera);*/
    setState(() {
      if (imageGallery != null) {
        file = File(imageGallery.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final dark = HelperFunctions.isDarkMode(context);

    return BlocProvider(
      create: (context) => RegisterCubit(RegisterInitialSata(),
          apiService: ApiService(dio: Dio())),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoadingSata) {
            const Center(child: CircularProgressIndicator());
          } else if (state is RegisterSuccessSata) {
            Get.offAll(() => const AppMainView(), transition: Transition.zoom);
          } else if (state is RegisterFailureSata) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (state.errorMessage == 'This phone has been used before') {
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
                  desc: 'This phone has been used before.',
                  btnOkOnPress: () {},
                ).show();
              } else if (state.errorMessage ==
                  'This email has been used before') {
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
                  desc: 'This email has been used before.',
                  btnOkOnPress: () {},
                ).show();
              } else if (state.errorMessage ==
                  'Password should be 6 characters at least') {
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
                  desc: 'Password should be 6 characters at least.',
                  btnOkOnPress: () {},
                ).show();
              } else if (state.errorMessage == 'Incorrect email format') {
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
                  desc: 'Incorrect email format.',
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
            print(state.errorMessage);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: height * .04,
                ),
                const Center(child: LogoText(text: 'REGISTER', size: 30)),
                SizedBox(
                  height: height * .03,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      file != null
                          ? Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: FileImage(File(file!.path))),
                                color: AppColors.kLightColor.withOpacity(.1),
                                shape: BoxShape.circle,
                              ),
                            )
                          : Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/profile/avtar.jpg')),
                                color: AppColors.kLightColor.withOpacity(.1),
                                shape: BoxShape.circle,
                              ),
                            ),
                      IconButton(
                          onPressed: () async {
                            await getImage();
                            if (file != null) {
                              Image.file(file!);
                            }
                          },
                          icon: const Icon(
                            Icons.camera_alt_rounded,
                            size: 27,
                            color: AppColors.primary,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                TextFormField(
                  onChanged: (value) {},
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your name';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {},
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person), labelText: 'Name'),
                ),
                SizedBox(
                  height: height * .02,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Email';
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
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Phone';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone), labelText: 'Phone'),
                ),
                SizedBox(
                  height: height * .02,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: height * .03,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (file!.path.isEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
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
                          desc: 'Chose Your image Profile To Continue',
                          btnOkOnPress: () {},
                        ).show();
                      });
                    } else if (formKey.currentState!.validate()) {
                      BlocProvider.of<RegisterCubit>(context).createUser(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                  child: const Text('Crate Account'),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have an Account?',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('LOGIN'))
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
