part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

class DynamicSearchEvent extends SearchEvent{
  final String searchText;

  const DynamicSearchEvent(this.searchText);
}
