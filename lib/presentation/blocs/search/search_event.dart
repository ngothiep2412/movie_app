part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SelectCategoryEvent extends SearchEvent {
  final int index;

  const SelectCategoryEvent({required this.index});
}

final class FetchMoviesEvent extends SearchEvent {}

class FetchMoreMoviesEvent extends SearchEvent {}
