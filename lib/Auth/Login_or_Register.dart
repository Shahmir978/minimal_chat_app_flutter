import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Pages/Login_Page.dart';
import 'package:minimal_chat_app_flutter/Pages/Register_Page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially show login page
  bool showLoginPage = true;

  // toggle between login and register

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login_Page(onTap: togglePages);
    } else {
      return Register_Page(onTap: togglePages);
    }
  }
}
