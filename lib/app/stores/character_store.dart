import 'package:marvel_pedia/app/models/character_model.dart';
import 'package:marvel_pedia/app/repositories/character_repository.dart';
import 'package:mobx/mobx.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStoreBase with _$CharacterStore;
abstract class _CharacterStoreBase with Store {

  @action
  Future<List<Character>> fetchList() async {
    return CharacterRepository().fetchCharacterList();
  }
}