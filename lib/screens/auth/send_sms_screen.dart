import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/route/screen_name.dart';
import 'package:watchstore/screens/auth/cubit/auth_cubit.dart';
import 'package:watchstore/widgets/app_text_field.dart';
import 'package:watchstore/widgets/main_button.dart';

class SendSmsScreen extends StatelessWidget {
  SendSmsScreen({super.key});
  final TextEditingController _mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.png.mainLogo.path),
              Dimens.large.sizedBoxHeight,
              AppTextField(
                label: AppStrings.enterYourNumber,
                hint: AppStrings.hintPhoneNumber,
                controller: _mobileController,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthVerifyState) {
                    Navigator.pushNamed(context, ScreenName.verifyCodeScreen,
                        arguments: state.mobile);
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
                  if (state is AuthLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return MainButton(
                      buttonText: AppStrings.next,
                      onpressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .sendSms(_mobileController.text);
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
