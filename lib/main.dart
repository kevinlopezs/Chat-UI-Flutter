import 'package:chat_app/presentation/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/config/theme/app_theme.dart';
import 'package:chat_app/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //This is the Multiprovider creation for CRUD data in app
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 6).miTemitaSocito(),
          home: const ChatScreen()),
    );
  }
}
