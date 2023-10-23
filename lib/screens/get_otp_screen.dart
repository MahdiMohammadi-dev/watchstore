import 'package:flutter/material.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/route/screen_name.dart';
import 'package:watchstore/widgets/app_text_field.dart';
import 'package:watchstore/widgets/main_button.dart';

class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});
  TextEditingController _controller = TextEditingController();
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
              Dimens.medium.sizedBoxHeight,
              Text(
                AppStrings.otpCodeSendFor
                    .replaceAll(AppStrings.replace, "09123324848"),
                style: LightAppTextStyle.title,
              ),
              Dimens.small.sizedBoxHeight,
              Text(
                AppStrings.wrongNumberEditNumber,
                style: LightAppTextStyle.wrongEditNumber,
              ),
              Dimens.large.sizedBoxHeight,
              AppTextField(
                label: AppStrings.enterVerificationCode,
                hint: AppStrings.hintVerificationCode,
                controller: _controller,
                prefixLabel: "2:15",
              ),
              MainButton(
                buttonText: AppStrings.next,
                onpressed: () {
                  Navigator.pushNamed(context, ScreenName.registerScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
