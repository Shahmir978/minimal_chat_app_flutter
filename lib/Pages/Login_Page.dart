// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Auth/auth_service.dart';
import 'package:minimal_chat_app_flutter/Components/makeTextfield.dart';
import 'package:minimal_chat_app_flutter/Components/make_button.dart';

class Login_Page extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  // tap to go to register page
  final void Function()? onTap;
  Login_Page({super.key, required this.onTap});

  void login(BuildContext context) async {
// get auth service
    final authService = AuthService();

// try login
    try {
      await authService.signInWithEmailPassword(
          _emailcontroller.text, _passwordcontroller.text);
    }
// catch any errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),

            // welcome back msg
            Text(
              "Welcome back, You've been missed.",
              style: TextStyle(
                  fontSize: 18, color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),

            // email textfield
            makeTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: _emailcontroller,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),

            // password textfield
            makeTextfield(
              hintText: 'password',
              obscureText: true,
              controller: _passwordcontroller,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            //login button
            makeButton(
              text: 'Login',
              onTap: () => login(context),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Register here',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
