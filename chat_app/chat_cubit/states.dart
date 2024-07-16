import 'package:app_1/chat_app/chat_model.dart';

abstract class ChatStates {}

class InitialChatState extends ChatStates {}

class SuccessChatState extends ChatStates {
  List<MessageModel> messageList=[];
  SuccessChatState({required this.messageList});
}