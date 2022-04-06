import 'package:bloc/bloc.dart';
import 'package:flutter_english_app/models/word_model.dart';
import 'package:flutter_english_app/repositories/word_repository.dart';
import 'package:meta/meta.dart';

part 'word_search_event.dart';
part 'word_search_state.dart';

class WordSearchBloc extends Bloc<WordSearchEvent, WordSearchState> {
  final WordRepository _wordRepository;

  WordSearchBloc(this._wordRepository) : super(WordSearchInitial()) {
    on<LoadWordEvent>((event, emit) async {
      emit(WordSearchLoadingState());

      try {
        final word = await _wordRepository.getWord(event.searchedWord);
        emit(WordSearchLoadedState(word: word));
      } catch (e) {
        emit(WordSearchErrorState(e.toString()));
      }
    });
  }
}
