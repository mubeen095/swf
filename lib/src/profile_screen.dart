import 'package:coffee_shop/core/config/colors.dart';
import 'package:coffee_shop/core/config/routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              context.go('/b/details',extra: "Profile Detail from section B tab");
            },
            child: Text("Profile detail"),
          ),
        ],
      ),
    );
  }
}
