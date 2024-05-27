import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Auth/Login_or_Register.dart';
import 'package:minimal_chat_app_flutter/Pages/Home_Page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in
            if (snapshot.hasData) {
              return const HomePage();
            }
            // user is NOT logged in
            else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
