import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Pages/Login_Page.dart';
import 'package:minimal_chat_app_flutter/Pages/Register_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade300,
          primary: Colors.grey.shade500,
          secondary: Colors.grey.shade200,
          tertiary: Colors.white,
          inversePrimary: Colors.grey.shade900,
        ),
      ),
      home: Register_Page(),
    );
  }
}
