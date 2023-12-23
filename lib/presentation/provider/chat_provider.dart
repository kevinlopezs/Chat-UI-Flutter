import 'package:chat_app/config/helpers/get_yes_no_answer.dart';
import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  ChatProvider();

  //This is an instance for yesNoModel
  final getYesNoAnswer = GetYesNoAnswer();

  //This is for auto scroll when user send a new message
  final ScrollController chatScrollController = ScrollController();

  //This if for control TextFormField
  final TextEditingController textController = TextEditingController();

  //Here create a list of messages to show in ListView chat
  List<Message> messageList = [
    Message(text: 'Testing message one', fromWho: FromWho.me),
    Message(text: 'Testing second message', fromWho: FromWho.me)
  ];

  //This is a future function to expect user in any moment input a text value
  Future<void> sendMessage(String text) async {
    //this 'TODO: ....' indicates there's something waiting to do
    //TODO: implements method

    final newMessage = Message(text: text, fromWho: FromWho.me);
    //This is a rectriction for user can't send empty message
    if (text.isEmpty) return;
    messageList.add(newMessage);
    //This is a condition
    if (text.endsWith('?')) herReply();

    notifyListeners();
    moveScrollToBottom();
  }

  //Method for use model from http
  //This is an instance for use model methods from http
  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  //Changed scrollToBottom
  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
