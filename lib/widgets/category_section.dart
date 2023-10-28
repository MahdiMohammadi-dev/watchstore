import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.size,
    required this.titleCategory,
    required this.iconPath,
    required this.gradient,
    required this.ontap,
  });

  final Size size;
  final String titleCategory;
  final String iconPath;
  final LinearGradient gradient;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
              margin: EdgeInsets.all(Dimens.small),
              width: size.height * .1,
              height: size.height * .1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.large),
                  gradient: gradient),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60, child: SvgPicture.asset(iconPath)),
                ],
              )),
        ),
        SizedBox(
          height: Dimens.small,
        ),
        Text(
          titleCategory,
          style: LightAppTextStyle.title,
        )
      ],
    );
  }
}
