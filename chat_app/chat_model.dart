class MessageModel
{
  final String messages;
  final String id;
  MessageModel(this.messages,this.id);
  factory MessageModel.fromJson(jsonData){
    return MessageModel(jsonData['sentMessages'],jsonData['id']);
  }
}
