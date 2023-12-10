import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/screens/mainscreens/basket_screen.dart';
import 'package:watchstore/screens/mainscreens/home_screen.dart';
import 'package:watchstore/screens/mainscreens/profile.dart';
import 'package:watchstore/widgets/bottom_nav_icon.dart';

abstract class BottomNavIndexItem {
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
  final List<int> _routeHistory = [BottomNavIndexItem.homeIndex];

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
    } else if (_routeHistory.length > 1) {
      setState(() {
        _routeHistory.removeLast();
        indexSelected = _routeHistory.last;
      });
      print("Remove List is : $_routeHistory");
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
                    key: basketScreenKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const BasketScreen(),
                    ),
                  ),
                  Navigator(
                    key: profileScreenKey,
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
                      svgIconPath: Assets.svg.cart,
                      iconTitle: AppStrings.basket,
                      cartCount:0,
                      isActive:
                          indexSelected == BottomNavIndexItem.basketIndex,
                      onpressed: () => btmNavPressed(
                          index: BottomNavIndexItem.basketIndex),
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

  btmNavPressed({required int index}) {
    setState(() {
      indexSelected = index;
      _routeHistory.add(indexSelected);
      print("ADDDD: $_routeHistory");
    });
  }
}
