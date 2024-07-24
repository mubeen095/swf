import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Detail")),
      body: Column(
        children: [
          const Text("Home Detail"),
          TextButton.icon(
            onPressed: () {
              
              context.go('/a/details/profile', extra: "Profile Screen from Tab A");
            },
            icon: const Icon(Icons.arrow_forward),
            label: const Text("Profile"),
          )
        ],
      ),
    );
  }
}
