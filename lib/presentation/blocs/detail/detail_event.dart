part of 'detail_bloc.dart';

sealed class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

final class FetchMovieAndEpisodeEvent extends DetailEvent {
  final String slugName;

  const FetchMovieAndEpisodeEvent({required this.slugName});
}

final class ExpandedTextEvent extends DetailEvent {
  final bool isExpanded;

  const ExpandedTextEvent({required this.isExpanded});
}

final class WatchMovieEvent extends DetailEvent {
  final String linkEpisodes;

  const WatchMovieEvent({required this.linkEpisodes});
}
