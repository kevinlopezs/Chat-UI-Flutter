import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HerChatMessageBubble extends StatelessWidget {
  const HerChatMessageBubble({super.key, required this.messageFromHer});

  //Variable for storage message from her http
  final Message messageFromHer;

  @override
  Widget build(BuildContext context) {
    //User theme colors
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(messageFromHer.text,
                style: const TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 5),
        //You need to put on messageFromher.imageUrl! -->!<-- because
        //is necessary to make it required
        //we know http map responde always give us an image url
        _ImageBubble(messageFromHer.imageUrl!),
        const SizedBox(height: 10)
      ],
    );
  }
}

//Custom gif image
class _ImageBubble extends StatelessWidget {
  //
  final String urlFromHer;

  const _ImageBubble(this.urlFromHer);

  @override
  Widget build(BuildContext context) {
    //MediaQuery me permite conocer el tamaño del dispostivo y propiedades
    final size = MediaQuery.of(context).size;

    //ClipRRecta genera un borde redondeado para la imagen
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        //This is the url from her
        urlFromHer,
        //Metodo para mostrar algo mientas carga la imagen
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.5,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Loading image...'),
          );
        },
        height: 150,
        width: size.width * 0.5,
        fit: BoxFit.cover,
      ),
    );
  }
}
