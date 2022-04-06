part of 'word_search_bloc.dart';

@immutable
abstract class WordSearchState {}

class WordSearchInitial extends WordSearchState {}

class WordSearchLoadingState extends WordSearchState {}

class WordSearchLoadedState extends WordSearchState {
  final WordModel word;

  WordSearchLoadedState({required this.word});
}

class WordSearchErrorState extends WordSearchState {
  final String errorMessage;

  WordSearchErrorState(this.errorMessage);
}
