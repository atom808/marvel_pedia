import 'package:marvel_pedia/app/models/character_model.dart';
import 'package:marvel_pedia/app/repositories/character_repository.dart';
import 'package:mobx/mobx.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStoreBase with _$CharacterStore;
abstract class _CharacterStoreBase with Store {

  // @observable
  // int offset = 1;

  @action
  Future<List<Character>> fetchList({int? offset}) async {
    List<Character> list = await CharacterRepository().fetchCharacterList(offset: offset);
    return list;
  }
}