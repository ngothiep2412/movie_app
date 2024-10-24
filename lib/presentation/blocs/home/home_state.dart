part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final List<MovieModel> movies;

  const HomeLoadedState({
    this.movies = const [],
  });

  @override
  List<Object> get props => [movies];
}

final class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
