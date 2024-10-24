import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/constants/my_constant.dart';
import 'package:movie_app/core/services/init_getit.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) {
    on<FetchMoviesEvent>(_onFetchMovies);
    on<SelectCategoryEvent>(_onSelectCategory);
  }

  Future<void> _onSelectCategory(event, emit) async {
    if (state is SearchLoadedState) {
      emit(SearchLoadingSkeletonState());

      var movies = await _movieRepository.fetchMovies(page: 1);

      emit(
        SearchLoadedState(
          currentPage: 1,
          index: event.index,
          movies: movies,
        ),
      );
    }
  }

  final MovieRepository _movieRepository = getIt<MovieRepository>();

  Future<void> _onFetchMovies(event, emit) async {
    try {
      emit(SearchLoadingState());

      var movies = await _movieRepository.fetchMovies(page: 1);

      emit(SearchLoadedState(
        movies: movies,
        index: 0,
        currentPage: 1,
        categories: kCategories,
      ));
    } catch (e) {
      emit(SearchErrorState(message: 'Failed to load movies $e'));
    }
  }
}
