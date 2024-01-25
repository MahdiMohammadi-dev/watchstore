import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/route/screen_name.dart';
import 'package:watchstore/screens/auth/cubit/auth_cubit.dart';
import 'package:watchstore/widgets/app_text_field.dart';
import 'package:watchstore/widgets/avatar.dart';
import 'package:watchstore/widgets/main_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController nameLastNameController = TextEditingController();
  TextEditingController homeNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Dimens.large.sizedBoxHeight,
                  Avatar(),

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
                  AppTextField(
                      label: AppStrings.location,
                      hint: AppStrings.hintLocation,
                      controller: locationController,
                      icon: const Icon(Icons.location_on)),
                  Dimens.medium.sizedBoxHeight,
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthRegistered) {
                        Navigator.pushNamed(context, ScreenName.mainscreen);
                      } else if (state is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text(
                              state.appException.message,
                              style: LightAppTextStyle.title,
                            )));
                      }
                    },
                    builder: (context, state) {
                      return MainButton(
                        buttonText: AppStrings.next,
                        onpressed: () {},
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
