import 'package:get_it/get_it.dart';
import 'package:movie_app/data/data_source/remote/api_client.dart';
import 'package:movie_app/data/respository/movie_repository_impl.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/presentation/blocs/detail/detail_bloc.dart';
import 'package:movie_app/presentation/blocs/home/home_bloc.dart';
import 'package:movie_app/presentation/blocs/search/search_bloc.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  // Api client
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  // Dependencies
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getIt<ApiClient>()));

  // Blocs
  getIt.registerLazySingleton<HomeBloc>(() => HomeBloc());
  getIt.registerLazySingleton<SearchBloc>(
    () => SearchBloc(),
  );
  getIt.registerLazySingleton<DetailBloc>(
    () => DetailBloc(),
  );
}
