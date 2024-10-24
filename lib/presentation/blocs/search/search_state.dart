part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitialState extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchLoadingSkeletonState extends SearchState {}

final class SearchLoadedState extends SearchState {
  final List<MovieModel> movies;
  final int currentPage;
  final int index;
  final List<String> categories;

  const SearchLoadedState({
    this.movies = const [],
    this.currentPage = 0,
    this.index = 0,
    this.categories = kCategories,
  });

  @override
  List<Object> get props => [movies, currentPage, index];
}

final class SearchLoadingMoreState extends SearchState {
  final List<MovieModel> movies;
  final int currentPage;
  final int index;
  final List<String> categories;

  const SearchLoadingMoreState({
    this.movies = const [],
    this.currentPage = 0,
    this.index = 0,
    this.categories = kCategories,
  });

  @override
  List<Object> get props => [movies, currentPage];
}

final class SearchErrorState extends SearchState {
  final String message;

  const SearchErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
