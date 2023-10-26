import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';

import '../component/text_style.dart';

class BtmNavIcons extends StatelessWidget {
  String svgIconPath;
  String iconTitle;
  bool isActive;
  void Function() onpressed;
  BtmNavIcons(
      {super.key,
      required this.svgIconPath,
      required this.iconTitle,
      required this.isActive,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        color: AppColors.bottomNavColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgIconPath,
                colorFilter: ColorFilter.mode(
                    isActive ? Colors.black : Colors.grey, BlendMode.srcIn),
              ),
              Dimens.small.sizedBoxHeight,
              Text(
                iconTitle,
                style: isActive
                    ? LightAppTextStyle.bottomNavActive
                    : LightAppTextStyle.bottomNavDeActive,
              )
            ],
          ),
        ),
      ),
    );
  }
}
