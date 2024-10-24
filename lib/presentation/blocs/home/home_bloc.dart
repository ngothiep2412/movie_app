import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/services/init_getit.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>(_onFetchMovies);
  }

  final MovieRepository _movieRepository = getIt<MovieRepository>();

  Future<void> _onFetchMovies(event, emit) async {
    try {
      emit(HomeLoadingState());

      var movies = await _movieRepository.fetchMovies(page: 1);

      emit(HomeLoadedState(movies: movies));
    } catch (e) {
      emit(HomeErrorState(message: 'Failed to load movies $e'));
    }
  }
}
