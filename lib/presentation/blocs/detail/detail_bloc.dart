import 'dart:developer';
import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/services/init_getit.dart';
import 'package:movie_app/data/models/episode_model.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:video_player/video_player.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitialState()) {
    on<FetchMovieAndEpisodeEvent>(_onFetchMovie);
    on<ExpandedTextEvent>(_onExpandedText);
    on<WatchMovieEvent>(_onWatchMovieEvent);
  }

  final MovieRepository _movieRepository = getIt<MovieRepository>();

  Future<void> _onWatchMovieEvent(
      WatchMovieEvent event, Emitter<DetailState> emit) async {
    if (state is DetailLoadedState) {
      try {
        final currentState = state as DetailLoadedState;

        currentState.chewieController?.dispose();

        final videoController =
            VideoPlayerController.networkUrl(Uri.parse(event.linkEpisodes));

        log(event.linkEpisodes);

        await videoController.initialize();

        final chewieController = ChewieController(
          videoPlayerController: videoController,
          autoPlay: true,
        );

        emit(
          currentState.copyWith(
            isWatching: true,
            chewieController: chewieController,
          ),
        );
      } catch (e) {
        log('Error playing video: ${e.toString()}');
        // Reset video state on error
        emit((state as DetailLoadedState).copyWith(
          isWatching: false,
          chewieController: null,
        ));
      }
    }
  }

  Future<void> _onExpandedText(event, emit) async {
    if (state is DetailLoadedState) {
      final currentState = state as DetailLoadedState;
      emit(
        currentState.copyWith(
          isExpanded: event.isExpanded,
        ),
      );
    }
  }

  Future<void> _onFetchMovie(event, emit) async {
    MovieModel movie = MovieModel();

    emit(DetailLoadedState(
      movie: movie,
      isLoading: true,
    ));

    final currentState = state as DetailLoadedState;

    try {
      var response =
          await _movieRepository.fetchMovieAndEpisode(slugName: event.slugName);

      final jsonData = response.data;

      movie = MovieModel.fromJson(jsonData['movie']);

      log("movie: ${movie.toString()}");

      final episodes = (jsonData['episodes'] as List)
          .map(
            (episode) => EpisodeModel.fromJson(episode),
          )
          .toList();

      log("episodes: ${episodes.toString()}");

      movie.episodeList = episodes;
    } catch (e) {
      log(e.toString());
      emit(currentState.copyWith(
        isLoading: false,
      ));
    } finally {
      emit(currentState.copyWith(
        movie: movie,
        isLoading: false,
      ));
    }
  }

  @override
  Future<void> close() async {
    if (state is DetailLoadedState) {
      final currentState = state as DetailLoadedState;
      currentState.chewieController?.dispose();
    }
    return super.close();
  }
}
