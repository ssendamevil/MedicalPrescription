part of 'search_bloc.dart';

enum SearchStateType {initial, isLoading, success, failure}

class SearchState {
  final SearchStateType state;
  final List<String> searchResults;

  const SearchState({
    this.state = SearchStateType.initial,
    this.searchResults =const[]
  });


  SearchState copyOf({
    SearchStateType? state,
    List<String>? searchResults
  }){
    return SearchState(
      state: state ?? this.state,
      searchResults: searchResults ?? this.searchResults
    );
  }
}
