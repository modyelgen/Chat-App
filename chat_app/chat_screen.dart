import 'package:app_1/chat_app/chat_cubit/cubit.dart';
import 'package:app_1/chat_app/chat_cubit/states.dart';
import 'package:app_1/chat_app/chat_model.dart';
import 'package:app_1/chat_app/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ChatScreen extends StatelessWidget{
   ChatScreen({Key? key,this.email}) : super(key: key);
   String?message;
   String?email;
   TextEditingController controller=TextEditingController();
   final _controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:const Color(0xff2B475E),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/chat_app/scholar.png',height: 50,),
              const SizedBox(width: 5),
              const Text('Chat',style: TextStyle(color: Colors.white),)
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit,ChatStates>(
                builder: (context,state){
                  var messageList=BlocProvider.of<ChatCubit>(context).messageList;
                  return ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messageList.length,
                      itemBuilder: (context,index){
                        return messageList[index].id ==email?
                        ChatBubble(message: messageList[index],):ChatBubbleFriend(message: messageList[index]);
                      }
                  );
                },
              ),
            ),
            Padding(
              padding:const EdgeInsets.all(15.0),
              child:  TextField(
                controller:controller,
                onChanged: (data)
                {
                  message=data;
                },
                decoration: InputDecoration(
                    hintText: 'send message...',
                    suffixIcon: GestureDetector(
                        onTap: (){
                          BlocProvider.of<ChatCubit>(context).sendMessages(message: message!, email: email!);
                          _controller.animateTo(
                            0,
                            duration: const Duration(microseconds: 20),
                            curve: Curves.fastOutSlowIn,
                          );
                          controller.clear();
                        },child: const Icon(Icons.send_rounded,color: Color(0xff2B475E),)),
                    border: OutlineInputBorder(
                      borderSide:const BorderSide(
                        color:  Color(0xff2B475E),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                ),

              ),
            ),
          ],
        )
    );
  }
}


