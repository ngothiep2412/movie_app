import 'package:dio/dio.dart';
import 'package:movie_app/data/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> fetchMovies({
    int page = 1,
  });

  Future<Response> fetchMovieAndEpisode({
    required String slugName,
  });
}
