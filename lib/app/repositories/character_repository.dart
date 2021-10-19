import 'package:dio/dio.dart';
import 'package:marvel_pedia/app/models/character_model.dart';
import 'package:marvel_pedia/shared/services/http_service.dart';

class CharacterRepository {

  Future<List<Character>> fetchCharacterList({int? offset}) async {

    Response response = await HttpService().getRequest(endPoint: '/v1/public/characters', offset: offset);
    // log('REPOSITORY - response: ' + response.toString());

    List responseList = response.data['data']['results'] as List;
    // log('REPOSITORY - responseList: ' + responseList.toString());

    List<Character> characterList = responseList.map((e) => Character.fromJson(e)).toList();
    // log('REPOSITORY - characterList: ' + characterList.toString());

    return characterList;
  }
}