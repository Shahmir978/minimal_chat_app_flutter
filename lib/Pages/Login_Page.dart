import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Components/makeTextfield.dart';
import 'package:minimal_chat_app_flutter/Components/make_button.dart';

class Login_Page extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  Login_Page({super.key});

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
            makeButton(text: 'Login'
                // onTap:login,
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            // register now
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member? ',style: TextStyle(color:  Theme.of(context).colorScheme.primary),),
                Text('Register here',style: TextStyle(color:  Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
