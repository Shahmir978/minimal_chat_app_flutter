

import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Components/UserTile.dart';

import 'package:minimal_chat_app_flutter/Components/makeDrawer.dart';
import 'package:minimal_chat_app_flutter/Pages/Chat_Page.dart';
import 'package:minimal_chat_app_flutter/Services/Auth/auth_service.dart';
import 'package:minimal_chat_app_flutter/Services/Chat/chat_Service.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  // chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page'),
      ),
      drawer: makeDrawer(),
      body: _buildUserList(),
    );
  }

// build a list of users except the current logged in user
Widget _buildUserList(){
  return StreamBuilder(stream: _chatService.getUsersStream(), builder: (context , snapshot){
    //errror
    if(snapshot.hasError){
      return const Text('Error');
    }

    // loading..
    if(snapshot.connectionState == ConnectionState.waiting){
      return const Text('Loading...');

    }

    //return listview
    return ListView(
      children: snapshot.data!.map<Widget>((userData)=> _buildUserListItem(userData,context)).toList(),
    );

  });
}
// build individual user
Widget _buildUserListItem(Map<String,dynamic> userData, BuildContext context){
  // display all user except current user
  return UserTile(onTap: () { 
    // go to chat
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(recieverEmail:userData["email"],)));
   }, text: userData["email"],);
}
}
