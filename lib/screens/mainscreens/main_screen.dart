import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/screens/mainscreens/basket_screen.dart';
import 'package:watchstore/screens/mainscreens/home_screen.dart';
import 'package:watchstore/screens/mainscreens/profile.dart';
import 'package:watchstore/widgets/bottom_nav_icon.dart';

class BottomNavIndexItem {
  BottomNavIndexItem._();
  static const homeIndex = 0;
  static const basketIndex = 1;
  static const profileIndex = 2;
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexselected = BottomNavIndexItem.homeIndex;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: size.height * .1,
            child: IndexedStack(
              index: indexselected,
              children: const [
                HomeScreen(),
                BasketScreen(),
                ProfileScreen(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: AppColors.bottomNavColor,
              height: size.height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BtmNavIcons(
                    svgIconPath: Assets.svg.user,
                    iconTitle: AppStrings.profile,
                    isActive: indexselected == BottomNavIndexItem.profileIndex,
                    onpressed: () =>
                        btmNavPressed(index: BottomNavIndexItem.profileIndex),
                  ),
                  BtmNavIcons(
                    svgIconPath: Assets.svg.basket,
                    iconTitle: AppStrings.basket,
                    isActive: indexselected == BottomNavIndexItem.basketIndex,
                    onpressed: () =>
                        btmNavPressed(index: BottomNavIndexItem.basketIndex),
                  ),
                  BtmNavIcons(
                    svgIconPath: Assets.svg.home,
                    iconTitle: AppStrings.home,
                    isActive: indexselected == BottomNavIndexItem.homeIndex,
                    onpressed: () =>
                        btmNavPressed(index: BottomNavIndexItem.homeIndex),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  btmNavPressed({required index}) {
    setState(() {
      indexselected = index;
    });
  }
}
