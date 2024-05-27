import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Auth/auth_service.dart';
import 'package:minimal_chat_app_flutter/Components/makeDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page'),
      ),
      drawer: makeDrawer(),
    );
  }
}
