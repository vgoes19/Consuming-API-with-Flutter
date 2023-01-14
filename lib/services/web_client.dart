//import 'package:flutter_api/models/character.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import '../models/character.dart';


class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    //print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    //print(data.toString());
    return data;
  }
}

class CharacterService {

  Future<List<Character>> findCharactersPage(int page) async{
    List<Character> listCharacters = [];
    final Client client = InterceptedClient.build(interceptors: [ LoggingInterceptor() ]);
    final Response response = await client.get(Uri.parse('https://rickandmortyapi.com/api/character?page=${page}'));
    var responseData = json.decode(response.body);

    for (var character in responseData["results"]) {
      listCharacters.add(Character.fromJson(character));
    }

    return listCharacters;
  }

}

