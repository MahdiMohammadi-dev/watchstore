import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/component/theme.dart';
import 'package:watchstore/route/routes.dart';
import 'package:watchstore/route/screen_name.dart';
import 'package:watchstore/screens/auth/cubit/auth_cubit.dart';
import 'package:watchstore/screens/auth/send_sms_screen.dart';
import 'package:watchstore/screens/home/home_screen.dart';
import 'package:watchstore/screens/mainscreens/main_screen.dart';
import 'package:watchstore/utils/shared_prefrences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrencesManager().initSharedPrefrences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        // initialRoute: ScreenName.root,
        // routes: routes,
        theme: lightTheme(),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        // home: BlocBuilder<AuthCubit, AuthState>(
        //   builder: (context, state) {
        //     if (state is AuthLoggedInState) {
        //       return const MainScreen();
        //     } else if (state is AuthLoggedOutState) {
        //       return SendSmsScreen();
        //     } else {
        //       return SendSmsScreen();
        //     }
        //   },
        // ),
      ),
    );
  }
}
