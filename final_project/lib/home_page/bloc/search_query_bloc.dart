import 'package:final_project/api_client/api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/movies.dart';

part 'search_query_event.dart';
part 'search_query_state.dart';

class SearchQueryBloc extends Bloc<SearchQueryEvent, SearchQueryState> {
  SearchQueryBloc() : super(SearchQueryInitial()) {
    on<SendSearchRequestEvent>(_onSendSearchRequestEvent);
  }

  _onSendSearchRequestEvent(
      SearchQueryEvent event, Emitter<SearchQueryState> emit) async {
    emit(SearchQueryLoadingState());
    try {
      final formatter = DateFormat('yyyy-MM-dd');
      final query = event.searchQuery;
      final date = (query == null || query.isEmpty)
          ? formatter.format(
              (event.searchDate != null) ? event.searchDate! : DateTime.now(),
            )
          : '';
      final movie = await APIClient().listOfMovies(date, query ?? '');
      emit(SearchQueryFinishedState(movie));
    } catch (e) {
      emit(SearchQueryErrorState());
    }
  }
}
