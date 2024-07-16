import 'package:app_1/chat_app/chat_cubit/states.dart';
import 'package:app_1/chat_app/chat_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatCubit extends Cubit<ChatStates>{
  ChatCubit():super(InitialChatState());
  CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  List<MessageModel> messageList=[];
  void sendMessages({required String message,required String email}){
    messages.add({
      'sentMessages':message,
      'createdTime':DateTime.now(),
      'id':email,
    });
  }
  void getMessages(){
    messages.orderBy('createdTime',descending: true).snapshots().listen((event) 
    {
      messageList.clear();
      for( var doc in event.docs ){
      messageList.add(MessageModel.fromJson(doc));
      }
      emit(SuccessChatState(messageList: messageList));
    });
  }
}
