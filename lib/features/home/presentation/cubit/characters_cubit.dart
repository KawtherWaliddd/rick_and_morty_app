import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/home/data/models/charachter.dart';
import 'package:rick_and_morty/features/home/data/reposatories/charachter_web_services_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharachterWebServicesRepo charachterWebServicesRepo;

  CharactersCubit(this.charachterWebServicesRepo) : super(CharactersInitial());

  Future<void> getAllCharacters() async {
    emit(CharactersLoading());
    try {
      final List<Results> characters = await charachterWebServicesRepo
          .getAllCharachters();
      emit(CharactersLoaded(characters: characters));
    } catch (error) {
      emit(CharactersFailure(error: error.toString()));
    }
  }
}
