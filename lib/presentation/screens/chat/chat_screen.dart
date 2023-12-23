import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/presentation/provider/chat_provider.dart';
import 'package:chat_app/presentation/widgets/chat/her_custom_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/presentation/widgets/chat/custom_message_widget.dart';
import '../../widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBarChatScreen(
        backButton: Icon(Icons.arrow_back_ios_new_rounded),
        topTitle: 'Chat Screen',
        topChatAvarUrl:
            'https://yoolk.ninja/wp-content/uploads/2022/04/OnePiece-Monkey-D-Luffy-1024x819.png',
        videoCallPerson: Icon(Icons.videocam),
        callPerson: Icon(Icons.call),
        leadingWidth: 90.0,
      ),
      body: _CustomBodyChatScreen(),
    );
  }
}

//This is custom AppBar for ChatScreen
class _AppBarChatScreen extends StatelessWidget implements PreferredSize {
  //Properties
  final Icon backButton;
  final String topChatAvarUrl;
  final String topTitle;
  final Icon callPerson;
  final Icon videoCallPerson;
  final double leadingWidth;

  const _AppBarChatScreen(
      {required this.backButton,
      required this.topChatAvarUrl,
      required this.topTitle,
      required this.callPerson,
      required this.videoCallPerson,
      required this.leadingWidth});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //Increasing leading width you can delete flex size problem
      leadingWidth: leadingWidth,
      leading: Row(
        children: [
          IconButton(onPressed: () {}, icon: backButton),
          CircleAvatar(backgroundImage: NetworkImage(topChatAvarUrl)),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: videoCallPerson),
        IconButton(onPressed: () {}, icon: callPerson)
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(topTitle)),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}

//This is custom Body for ChatScreen
//Here we have the first creation for a ListView
class _CustomBodyChatScreen extends StatelessWidget {
  const _CustomBodyChatScreen();

  @override
  Widget build(BuildContext context) {
    //Lets create an instance of provider to change data
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                //This is for auto scroll when user send a new message
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  //In this step we use word "message" for instance chatProvider list
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.me)
                      ? ChatMessageBubble(messageText: message)
                      : HerChatMessageBubble(messageFromHer: message);
                },
              ),
            ),
            //const Text('Testing safe area'),
            //This is custom widget for TextFormField
            CustomTextFieldChatMessage(
              //onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
