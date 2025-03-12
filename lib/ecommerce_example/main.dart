import 'package:flutter/material.dart';
import 'package:flutter_library/src/e_commerce/ecom_flutter_library.dart';
import 'ecommerce_example_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Flutter Library',
      theme: EcommerceTheme.lightTheme,
      darkTheme: EcommerceTheme.darkTheme,
      themeMode: ThemeMode.system, // Auto-switch based on system setting
      debugShowCheckedModeBanner: false,
      home: const EcommerceExampleScreen(),
    );
  }
}
