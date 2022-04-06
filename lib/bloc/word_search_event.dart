part of 'word_search_bloc.dart';

@immutable
abstract class WordSearchEvent {}

class LoadWordEvent extends WordSearchEvent {
  final String searchedWord;

  LoadWordEvent({required this.searchedWord});
}
