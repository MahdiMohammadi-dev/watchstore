import 'package:flutter/material.dart';
import 'package:watchstore/route/screen_name.dart';
import 'package:watchstore/screens/get_otp_screen.dart';
import 'package:watchstore/screens/mainscreens/main_screen.dart';
import 'package:watchstore/screens/product_list_screen.dart';
import 'package:watchstore/screens/product_single_screen.dart';
import 'package:watchstore/screens/register_screen.dart';
import 'package:watchstore/screens/send_otp_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenName.root: (context) => SendOtpScreen(),
  ScreenName.getOtpScreen: (context) => GetOtpScreen(),
  ScreenName.registerScreen: (context) => RegisterScreen(),
  ScreenName.mainscreen: (context) => MainScreen(),
  ScreenName.productListScreen: (context) => const ProductListScreen(),
  ScreenName.productSingleScreen: (context) => const ProductSingleScreen(),
};
