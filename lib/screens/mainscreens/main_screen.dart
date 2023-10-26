import 'package:flutter/material.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
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
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexSelected = BottomNavIndexItem.homeIndex;
  final GlobalKey<NavigatorState> homeScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> basketScreenKey = GlobalKey();
  final GlobalKey<NavigatorState> profileScreenKey = GlobalKey();

  late final routingMap = {
    BottomNavIndexItem.homeIndex: homeScreenKey,
    BottomNavIndexItem.basketIndex: basketScreenKey,
    BottomNavIndexItem.profileIndex: profileScreenKey,
  };

  Future<bool> onWillPop() async {
    if (routingMap[indexSelected]!.currentState!.canPop()) {
      routingMap[indexSelected]!.currentState!.pop();
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: size.height * .1,
              child: IndexedStack(
                index: indexSelected,
                children: [
                  Navigator(
                    key: homeScreenKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                  Navigator(
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const BasketScreen(),
                    ),
                  ),
                  Navigator(
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  ),
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
                      isActive:
                          indexSelected == BottomNavIndexItem.profileIndex,
                      onpressed: () =>
                          btmNavPressed(index: BottomNavIndexItem.profileIndex),
                    ),
                    BtmNavIcons(
                      svgIconPath: Assets.svg.basket,
                      iconTitle: AppStrings.basket,
                      isActive: indexSelected == BottomNavIndexItem.basketIndex,
                      onpressed: () =>
                          btmNavPressed(index: BottomNavIndexItem.basketIndex),
                    ),
                    BtmNavIcons(
                      svgIconPath: Assets.svg.home,
                      iconTitle: AppStrings.home,
                      isActive: indexSelected == BottomNavIndexItem.homeIndex,
                      onpressed: () =>
                          btmNavPressed(index: BottomNavIndexItem.homeIndex),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  btmNavPressed({required index}) {
    setState(() {
      indexSelected = index;
    });
  }
}
