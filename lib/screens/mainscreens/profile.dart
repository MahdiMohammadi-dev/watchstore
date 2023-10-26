import 'package:flutter/material.dart';
import 'package:watchstore/screens/product_single_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProductSingleScreen())),
            child: const Text("مشاهده همه")),
      ),
    );
  }
}
