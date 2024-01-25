import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/component/theme.dart';
import 'package:watchstore/data/http_client.dart';
import 'package:watchstore/route/routes.dart';
import 'package:watchstore/screens/auth/cubit/auth_cubit.dart';
import 'package:watchstore/screens/auth/send_sms_screen.dart';
import 'package:watchstore/screens/mainscreens/main_screen.dart';

void main() {
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
          routes: routes,
          theme: lightTheme(),
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthLoggedInState) {
                return const MainScreen();
              } else if (state is AuthLoggedOutState) {
                return SendSmsScreen();
              } else {
                return SendSmsScreen();
              }
            },
          )),
    );
  }
}
