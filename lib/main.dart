import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';
import 'package:simple_chat_bot/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:WelcomePage()
    );
  }



  
}


class Chat extends StatelessWidget {
  const Chat({super.key});

void startChat() {
    dynamic conversationObject = {
      'appId': '<APP_ID>',
      'withPreChat': true,
    };

    KommunicateFlutterPlugin.buildConversation(conversationObject)
        .then((clientConversationId) {
      print("Conversation builder success: " + clientConversationId.toString());
    }).catchError((error) {
      print("Conversation builder error: " + error.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Kommunicate Chatbot Example'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Start Chat'),
            onPressed: () {
              startChat();
            },
          ),
        ),
      );
  }
}
