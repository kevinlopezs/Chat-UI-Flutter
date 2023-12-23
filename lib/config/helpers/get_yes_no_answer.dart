import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    //STEP 1: get response from http link
    final response = await _dio.get('https://yesno.wtf/api');

    //Create a class of model for control Map data from http response
    //with an intance of that class model
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //Return a the method
    return yesNoModel.toMessageEntity();

    //This is an example for a convencional MAP
    //This is a volatil MAP
    /*
    return Message(
        text: response.data['answer'],
        fromWho: FromWho.hers,
        imageUrl: response.data['image']);

    */
  }
}
