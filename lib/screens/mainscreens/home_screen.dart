import 'package:flutter/material.dart';
import 'package:watchstore/route/screen_name.dart';
import 'package:watchstore/screens/product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductListScreen())),
            child: const Text("مشاهده همه")),
      ),
    );
  }
}
