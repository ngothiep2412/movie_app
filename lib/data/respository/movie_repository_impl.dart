import 'dart:convert';
import 'dart:developer';
import 'package:movie_app/data/data_source/remote/api_client.dart';
import 'package:movie_app/data/data_source/remote/api_endpoint_urls.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final ApiClient _apiClient;
  MovieRepositoryImpl(this._apiClient);

  @override
  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    final response = await _apiClient
        .getRequest(path: ApiEndpointUrls.phimMoiCapNhat, page: page)
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final jsonData = response.data;

      // log("jsonData: $response.data");

      final movies = (jsonData['items'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();

      return movies;
    } else {
      throw Exception("Failed to load movies: ${response.statusCode}");
    }
  }
}
