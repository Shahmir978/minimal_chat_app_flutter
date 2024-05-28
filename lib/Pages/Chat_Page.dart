// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app_flutter/Components/makeTextfield.dart';
import 'package:minimal_chat_app_flutter/Services/Auth/auth_service.dart';
import 'package:minimal_chat_app_flutter/Services/Chat/chat_Service.dart';

class ChatPage extends StatelessWidget {
  final String recieverEmail;
  final String receiverID;
  ChatPage({super.key, required this.recieverEmail, required this.receiverID});
  // text controller
  final TextEditingController _messageController = TextEditingController();

  // chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage() async {
    // only send message if there is anything inside the boxt to send
    if (_messageController.text.isNotEmpty) {
      // sned the message
      await _chatService.sendMessage(receiverID, _messageController.text);

      // clear text controller after sending message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          recieverEmail,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          // user input
          _buildUserInput(),

        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrenteUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        // errors
        if (snapshot.hasError) {
          return const Text('Error');
        }
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        //return list view
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data["message"]);
  }

  // build user input
  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
            child: makeTextfield(
                hintText: "Type a message",
                obscureText: false,
                controller: _messageController),),
                
                // make send button
                IconButton(onPressed: sendMessage, icon: const Icon(Icons.arrow_upward),)
      ],
    );
  }
}
