part of 'search_query_bloc.dart';

abstract class SearchQueryState {
  final Movies? movie;

  const SearchQueryState(this.movie);
}

class SearchQueryInitial extends SearchQueryState {
  SearchQueryInitial() : super(null);
}

class SearchQueryLoadingState extends SearchQueryState {
  SearchQueryLoadingState() : super(null);
}

class SearchQueryFinishedState extends SearchQueryState {
  const SearchQueryFinishedState(super.movie);
}

class SearchQueryErrorState extends SearchQueryState {
  SearchQueryErrorState() : super(null);
}
