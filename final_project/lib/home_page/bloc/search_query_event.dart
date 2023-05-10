part of 'search_query_bloc.dart';

abstract class SearchQueryEvent {
  final String? searchQuery;
  final DateTime? searchDate;

  const SearchQueryEvent(this.searchQuery, this.searchDate);
}

class SendSearchRequestEvent extends SearchQueryEvent {
  const SendSearchRequestEvent({String? searchQuery, DateTime? searchDate})
      : super(searchQuery, searchDate);
}
