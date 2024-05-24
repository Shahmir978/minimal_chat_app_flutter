import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Auth/Login_or_Register.dart';

import 'package:minimal_chat_app_flutter/Themes/Light_Mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: LoginOrRegister(),
    );
  }
}
