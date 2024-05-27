import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
void logout ()async{
  // get auth service
  final _auth = AuthService();
  _auth.signOut();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page'), actions: [
        IconButton(
          onPressed:logout,
          icon: Icon(Icons.logout_outlined),
        ),
      ]),
    );
  }
}
