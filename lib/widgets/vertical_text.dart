import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.large),
      child: Column(
        children: [
          Row(
            children: [
              RotatedBox(
                  quarterTurns: 1, child: SvgPicture.asset(Assets.svg.back)),
              const Text(
                AppStrings.viewAll,
                style: LightAppTextStyle.title,
              )
            ],
          ),
          Dimens.medium.sizedBoxHeight,
          Text(
            AppStrings.amazing,
            style: LightAppTextStyle.title.copyWith(
                color: const Color.fromARGB(
                  255,
                  57,
                  24,
                  80,
                ),
                fontSize: Dimens.large),
          )
        ],
      ),
    );
  }
}
