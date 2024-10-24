part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitialState extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchLoadedState extends SearchState {
  final List<MovieModel> movies;
  final int currentPage;
  final int selectedCategoryIndex;
  final List<String> categories;
  final bool? isLoadingMovie;

  const SearchLoadedState({
    this.movies = const [],
    this.currentPage = 0,
    this.selectedCategoryIndex = 0,
    this.categories = kCategories,
    this.isLoadingMovie = false,
  });

  SearchLoadedState copyWith({
    List<String>? categories,
    int? selectedCategoryIndex,
    List<MovieModel>? movies,
    int? currentPage,
    bool? isLoadingMovie,
  }) {
    return SearchLoadedState(
      categories: categories ?? this.categories,
      selectedCategoryIndex:
          selectedCategoryIndex ?? this.selectedCategoryIndex,
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      isLoadingMovie: isLoadingMovie ?? this.isLoadingMovie,
    );
  }

  @override
  List<Object> get props => [movies, currentPage, selectedCategoryIndex];
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
