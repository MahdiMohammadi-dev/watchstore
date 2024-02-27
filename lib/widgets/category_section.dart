import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/resouece/dimens.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.size,
    required this.titleCategory,
    required this.iconPath,
    required this.gradient,
    required this.onTap,
  });

  final Size size;
  final String titleCategory;
  final String iconPath;
  final LinearGradient gradient;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              margin: const EdgeInsets.all(Dimens.small),
              width: size.height * .11,
              height: size.height * .11,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.large),
                  gradient: gradient),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 70, child: Image.network(iconPath)),
                ],
              )),
        ),
        const SizedBox(
          height: Dimens.medium,
        ),
        Text(
          titleCategory,
          style: LightAppTextStyle.title,
        )
      ],
    );
  }
}
