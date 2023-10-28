import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/widgets/category_section.dart';
import 'package:watchstore/widgets/home_screen_slider.dart';
import 'package:watchstore/widgets/search_bar_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SearchBarSection(
              onTap: () {},
            ),
            const HomeScreenSlider(imglist: []),

            ///TODO:Category
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategorySection(
                    ontap: () {},
                    size: size,
                    titleCategory: AppStrings.desktop,
                    iconPath: Assets.svg.desktop,
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF8396E1), Color(0xFFE6FCFF)])),
                CategorySection(
                    ontap: () {},
                    size: size,
                    titleCategory: AppStrings.digital,
                    iconPath: Assets.svg.digital,
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFE183D4),
                          Color(0xFFFFE6F5),
                        ])),
                CategorySection(
                    ontap: () {},
                    size: size,
                    titleCategory: AppStrings.smart,
                    iconPath: Assets.svg.smart,
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 139, 162, 168),
                          Color.fromARGB(255, 223, 238, 245),
                        ])),
                CategorySection(
                    ontap: () {},
                    size: size,
                    titleCategory: AppStrings.classic,
                    iconPath: Assets.svg.clasic,
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 255, 166, 114),
                          Color.fromARGB(255, 255, 227, 200),
                        ])),
              ],
            ),
            const SizedBox(
              height: Dimens.large,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(children: [
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    // reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(Dimens.medium),
                      height: 298,
                      width: 200,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimens.medium,
                ),
                const RotatedBox(quarterTurns: -1, child: VerticalText())
              ]),
            )
          ],
        ),
      ),
    ));
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              RotatedBox(
                  quarterTurns: 1, child: SvgPicture.asset(Assets.svg.back)),
              Text(
                AppStrings.viewAll,
                style: LightAppTextStyle.title,
              )
            ],
          ),
          const Text(
            AppStrings.amazing,
            style: LightAppTextStyle.title,
          )
        ],
      ),
    );
  }
}
