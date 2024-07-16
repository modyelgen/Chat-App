import 'package:app_1/chat_app/chat_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key,required this.message}) : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(
            28,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color:  Color(0xff2B475E) ,
          ),
          child: Text(message.messages,style: const TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
class ChatBubbleFriend extends StatelessWidget {
  const ChatBubbleFriend({Key? key,required this.message}) : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(

          padding: const EdgeInsets.all(
            28,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            color:  Color(0xff006D84) ,
          ),
          child: Text(message.messages,style: const TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
class ChatSent extends StatelessWidget {
   const ChatSent({Key? key,required this.message}) : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(23),
          decoration:const BoxDecoration(
            color:  Color(0xff2B475E),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
          ),
          child: Text(message.messages,style: const TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
class ChatReceived extends StatelessWidget {
  const ChatReceived({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.all(23),
          decoration:const BoxDecoration(
              color:  Color(0xff006D84),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              )
          ),
          child:const Text('hello my friend',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

