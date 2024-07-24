import 'package:coffee_shop/core/config/routing.dart';
import 'package:coffee_shop/core/config/theme.dart';
import 'package:coffee_shop/dependency_injection.dart' as di;
import 'package:coffee_shop/features/auth/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      routerConfig: goRouter,
      builder: EasyLoading.init(),
    );
  }
}
