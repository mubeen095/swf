import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key, required this.profileId});
  final String profileId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Detail")),
      body: Column(
        children: [
          Text(profileId),
          const Text("Profile Detail"),
          ElevatedButton(
            onPressed: () {
              context.go(
                '/b/details/',
                extra: "from nested",
              );
            },
            child: const Text("profileDetail"),
          ),
        ],
      ),
    );
  }
}
