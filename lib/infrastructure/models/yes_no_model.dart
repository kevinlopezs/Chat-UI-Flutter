// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

//This is get it from QuickType.io

import 'package:chat_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  //Method for relation entities with map from Json
  //and used with points for better control
  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'si' : 'no',
      fromWho: FromWho.hers,
      imageUrl: image);
}
