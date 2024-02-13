import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/data/model/user_form_auth.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/route/screen_name.dart';
import 'package:watchstore/screens/auth/cubit/auth_cubit.dart';
import 'package:watchstore/screens/register/cubit/register_cubit.dart';
import 'package:watchstore/utils/image_cropper_picker.dart';
import 'package:watchstore/widgets/app_text_field.dart';
import 'package:watchstore/widgets/avatar.dart';
import 'package:watchstore/widgets/main_button.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameLastNameController = TextEditingController();

  TextEditingController homeNumberController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController postalCodeController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  ImageCropperPicker imageCropperPicker = ImageCropperPicker();
  double lat = 0.0;
  double lng = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.appbarColor,
          title: Container(
            width: double.infinity,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(Assets.svg.back)),
                  const Text(
                    AppStrings.register,
                    style: LightAppTextStyle.title,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: Dimens.medium),
              child: BlocProvider(
                create: (context) => RegisterCubit(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Dimens.large.sizedBoxHeight,
                    Avatar(
                      onTap: () async {
                        imageCropperPicker
                            .pickAndCropImage(source: ImageSource.gallery)
                            .then((value) => setState(() {}));
                      },
                      file: imageCropperPicker.getImage,
                    ),

                    ///TODO:Name & Last Name TextField
                    AppTextField(
                        label: AppStrings.nameLastName,
                        hint: AppStrings.hintNameLastName,
                        controller: nameLastNameController),
                    Dimens.medium.sizedBoxHeight,

                    ///TODO:Phone Number TextField
                    AppTextField(
                        label: AppStrings.homeNumber,
                        hint: AppStrings.hintHomeNumber,
                        controller: homeNumberController),
                    Dimens.medium.sizedBoxHeight,

                    ///TODO:Address TextField
                    AppTextField(
                        label: AppStrings.address,
                        hint: AppStrings.hintAddress,
                        controller: addressController),
                    Dimens.medium.sizedBoxHeight,

                    ///TODO:Postal Code TextField
                    AppTextField(
                        label: AppStrings.postalCode,
                        hint: AppStrings.hintPostalCode,
                        controller: postalCodeController),
                    Dimens.medium.sizedBoxHeight,

                    ///TODO:Location TextField
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is LocationPickedState) {
                          if (state.location != null) {
                            locationController.text = state.location!;
                            debugPrint('LAAAAT ==> ${state.latlng!.latitude}');
                            lat = state.latlng!.latitude;
                            lng = state.latlng!.latitude;
                          }
                        }
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<RegisterCubit>(context)
                                .getPickLocation(context: context);
                          },
                          child: AppTextField(
                              label: AppStrings.location,
                              hint: AppStrings.hintLocation,
                              controller: locationController,
                              icon: const Icon(Icons.location_on)),
                        );
                      },
                    ),

                    Dimens.medium.sizedBoxHeight,
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          Navigator.pushNamed(context, ScreenName.mainscreen);
                        } else if (state is RegsiterError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.exception.message)));
                        }
                      },
                      builder: (context, state) {
                        if (state is RegisterLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return MainButton(
                            buttonText: AppStrings.next,
                            onpressed: () async {
                              BlocProvider.of<RegisterCubit>(context)
                                  .SendDataToServerFromregister(
                                      user: UserFormAuth(
                                          name: nameLastNameController.text,
                                          phone: homeNumberController.text,
                                          address: addressController.text,
                                          postalCode: postalCodeController.text,
                                          image: await MultipartFile.fromFile(
                                              imageCropperPicker
                                                  .getImage!.path),
                                          lat: lat,
                                          lng: lng));
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
