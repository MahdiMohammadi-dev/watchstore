import 'dart:async';

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

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _smsCodecontroller = TextEditingController();
  @override
  void initState() {
    countDownTime();
    super.initState();
  }

  late Timer timer;
  int startTime = 10;
  countDownTime() {
    const onSec = Duration(seconds: 1);
    timer = Timer.periodic(onSec, (timer) {
      setState(() {
        if (startTime == 0) {
          timer.cancel();
          Navigator.of(context).pop();
        } else {
          startTime--;
        }
      });
    });
  }

  String formatTime(int sec) {
    int min = sec ~/ 60;
    int seconds = sec % 60;
    String minStr = min.toString().padLeft(2, "0");
    String SecondsStr = seconds.toString().padLeft(2, "0");
    return '$minStr:$SecondsStr';
  }

  @override
  Widget build(BuildContext context) {
    final mobilePhoneRouteArgs =
        ModalRoute.of(context)!.settings.arguments as String;
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
              Dimens.medium.sizedBoxHeight,
              Text(
                AppStrings.otpCodeSendFor
                    .replaceAll(AppStrings.replace, mobilePhoneRouteArgs),
                style: LightAppTextStyle.title,
              ),
              Dimens.small.sizedBoxHeight,
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Text(
                  AppStrings.wrongNumberEditNumber,
                  style: LightAppTextStyle.wrongEditNumber,
                ),
              ),
              Dimens.large.sizedBoxHeight,
              AppTextField(
                  label: AppStrings.enterVerificationCode,
                  hint: AppStrings.hintVerificationCode,
                  controller: _smsCodecontroller,
                  prefixLabel: formatTime(startTime)),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthUnRegistered) {
                    Navigator.pushNamed(context, ScreenName.registerScreen);
                  } else if (state is AuthRegistered) {
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
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return MainButton(
                      buttonText: AppStrings.next,
                      onpressed: () {
                        BlocProvider.of<AuthCubit>(context).verifyCode(
                            mobilePhoneRouteArgs, _smsCodecontroller.text);
                        Navigator.pushNamed(context, ScreenName.registerScreen);
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
