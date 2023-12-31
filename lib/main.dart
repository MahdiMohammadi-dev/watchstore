import 'package:flutter/material.dart';
import 'package:watchstore/component/theme.dart';
import 'package:watchstore/route/screen_name.dart';
import 'package:watchstore/screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: ScreenName.root,
        // routes: routes,
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
        home: const CartScreen());
  }
}
