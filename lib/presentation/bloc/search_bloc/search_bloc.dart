import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final List<String> allResults = [
    "Allergy",
    "Blood diseases",
    "Dog",
    "Dermatological diseases",
    "Doctors",
    "Diabetes",
    "Eye and ear drops",
    "Flu and colds",
    "Doctoscopia",
    "Gastrointestinal tract and liver",
    "Obstetrics and gynecology",
    "Respiratory system",
    "Allergy",
    "Blood diseases",
    "Dog",
    "Dermatological diseases",
    "Doctors",
    "Diabetes",
    "Eye and ear drops",
    "Flu and colds",
    "Doctoscopia",
    "Gastrointestinal tract and liver",
    "Obstetrics and gynecology",
    "Respiratory system",
  ];
  SearchBloc() : super( const SearchState()) {
    on<DynamicSearchEvent>(_onSearch);
  }

  Future<void> _onSearch(DynamicSearchEvent event, Emitter<SearchState> emit) async{
    emit(state.copyOf(state: SearchStateType.isLoading));
    List<String> results = [];

    if(event.searchText.isNotEmpty) {
      for (String word in allResults) {
        if (word.startsWith(event.searchText)) {
          results.add(word);
        }
      }
    }

    results.sort();
    results.sort((a, b)=> a.length.compareTo(b.length));

    emit(state.copyOf(state: SearchStateType.success, searchResults: results));

  }

}
