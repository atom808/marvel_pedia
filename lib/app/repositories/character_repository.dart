import 'dart:io';
import 'package:dio/dio.dart';
import 'package:marvel_pedia/app/models/character_model.dart';
import 'package:marvel_pedia/shared/services/http_service.dart';

class CharacterRepository {

  Future<List<Character>> fetchCharacterList() async {
    Response response = await HttpService().getRequest(endPoint: '/v1/public/characters');
    List responseList = response.data['data'] as List;
    List<Character> characterList = responseList.map((e) => Character.fromJson(e)).toList();
    return characterList;
  }
}