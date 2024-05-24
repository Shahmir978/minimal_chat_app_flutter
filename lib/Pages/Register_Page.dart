import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Components/makeTextfield.dart';
import 'package:minimal_chat_app_flutter/Components/make_button.dart';

class Register_Page extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpwcontroller = TextEditingController();
  final void Function()? onTap;

  Register_Page({super.key,required this.onTap});

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
              "Let's create an account for you",
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
              hintText: 'Password',
              obscureText: true,
              controller: _passwordcontroller,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            // confirm pw textfield
            makeTextfield(
              hintText: 'Confirm password',
              obscureText: true,
              controller: _confirmpwcontroller,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            //login button
            makeButton(text: 'Register'
                // onTap:login,
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(onTap: onTap,
                  child: Text(
                    'Login here',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
