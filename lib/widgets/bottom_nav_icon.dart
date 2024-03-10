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
  final cartCount;
  void Function() onpressed;

  BtmNavIcons(
      {super.key,
      required this.svgIconPath,
      required this.iconTitle,
      required this.isActive,
      required this.onpressed,
      this.cartCount = 0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Stack(
        children: [
          Container(
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
                            .copyWith(fontSize: 10)
                        : LightAppTextStyle.bottomNavDeActive
                            .copyWith(fontSize: 10),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: cartCount > 0 ? true : false,
            child: Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                child: Text(
                  cartCount.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
