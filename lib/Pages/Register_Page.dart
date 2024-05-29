import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:minimal_chat_app_flutter/Services/Auth/auth_service.dart';
import 'package:minimal_chat_app_flutter/Components/makeTextfield.dart';
import 'package:minimal_chat_app_flutter/Components/make_button.dart';

class Register_Page extends StatefulWidget {
  final void Function()? onTap;

  Register_Page({super.key, required this.onTap});

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  final TextEditingController _confirmpwcontroller = TextEditingController();

  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    // password match = create user
    if (_passwordcontroller.text == _confirmpwcontroller.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailcontroller.text, _passwordcontroller.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    // password match = create user

    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
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
              Iconsax.messages_1,
              size: 110,
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
              focusNode: null,
              obscureText: false,
              controller: _emailcontroller,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            // password textfield
            makeTextfield(
              focusNode: null,

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
              focusNode: null,
              controller: _confirmpwcontroller,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            //login button
            makeButton(
              text: 'Register', onTap: () => register(context),
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
                GestureDetector(
                  onTap: widget.onTap,
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
