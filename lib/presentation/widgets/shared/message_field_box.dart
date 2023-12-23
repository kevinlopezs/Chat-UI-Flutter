//import 'dart:html';

//import 'package:chat_app/presentation/provider/chat_provider.dart';
import 'package:flutter/material.dart';

class CustomTextFieldChatMessage extends StatelessWidget {
  //Method for use value in TextFormField
  final ValueChanged<String> onValue;

  const CustomTextFieldChatMessage({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    //This is a variable for control visibility in suffixicon when a user es typing...
    //bool isSuffixIconButtonVisible = false;

    //This is a controller for save TextFormField value
    final TextEditingController textController = TextEditingController();

    //This is a controller for keep focus on TextFormFiel chat
    final focusNode = FocusNode();

    //Custom Decoration for TextFormField
    //This border is decoration when user is not typing...
    //Is a local variable
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(20));

    //This focus border is descoration when user is typing...
    //Is a local variable
    final outlineFocusBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(20));

    //Decoration for TextFormField
    //Is a local variable
    final inputDecoration = InputDecoration(
      hintText: 'Type here..',
      filled: true, // This cause TextFormField has a background color
      focusColor: Colors.orange,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineFocusBorder,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_rounded),
        onPressed: () {
          //Here we create a local variable to store text
          final textValue = textController.value.text;
          //print('Button $textValue');
          onValue(textValue);
          textController.clear();

          //print('valor de la caja de texto');
        },
      ),
    );

    //This is TextFormField widget
    return TextFormField(
      //event for close TextFormField when a user tap outside TextFormfield chat
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        focusNode.requestFocus();
        final textValue = textController.value.text;
        onValue(textValue);
        //print('Valor del texto $textValue');
        textController.clear();
      },
      onChanged: (value) {},
    );
  }
}
