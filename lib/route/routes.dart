import 'package:flutter/material.dart';
import 'package:watchstore/route/screen_name.dart';
import 'package:watchstore/screens/auth/send_sms_screen.dart';
import 'package:watchstore/screens/auth/verify_code_screen.dart';

import 'package:watchstore/screens/mainscreens/main_screen.dart';
import 'package:watchstore/screens/product_list/product_list_screen.dart';
import 'package:watchstore/screens/product_single_screen.dart';
import 'package:watchstore/screens/register/register_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenName.sendSmsScreen: (context) => SendSmsScreen(),
  ScreenName.verifyCodeScreen: (context) => VerifyCodeScreen(),
  ScreenName.registerScreen: (context) => RegisterScreen(),
  ScreenName.mainscreen: (context) => const MainScreen(),
  ScreenName.productListScreen: (context) => const ProductListScreen(),
  ScreenName.productSingleScreen: (context) => const ProductSingleScreen(),
};
