import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchlog/bloc/SearchRepository.dart';
import 'SearchEvent.dart';
import 'SearchResultError.dart';
import 'SearchState.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.githubRepository})
      : super(SearchStateEmpty());

  final SearchRepository githubRepository;

  @override
  Stream<SearchState> mapEventToState(event) async* {
    if (event is TextChanged) {
      final searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          // final results = await githubRepository.search(searchTerm);
          // yield SearchStateSuccess(results.items);
        } catch (error) {
          yield error is SearchResultError
              ? SearchStateError(error.message)
              : SearchStateError('something went wrong');
        }
      }
    }
  }

}
