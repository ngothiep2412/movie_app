part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

final class DetailInitialState extends DetailState {}

final class DetailLoadingState extends DetailState {}

final class DetailLoadedState extends DetailState {
  final MovieModel movie;
  final bool isLoading;
  final bool isExpanded;
  final bool isWatching;
  // final FlickManager? flickManager;
  final ChewieController? chewieController;

  const DetailLoadedState({
    required this.movie,
    this.isLoading = false,
    this.isExpanded = false,
    this.isWatching = false,
    // this.flickManager,
    this.chewieController,
  });

  DetailLoadedState copyWith({
    MovieModel? movie,
    bool? isLoading,
    bool? isExpanded,
    bool? isWatching,
    final ChewieController? chewieController,
  }) {
    return DetailLoadedState(
      movie: movie ?? this.movie,
      isLoading: isLoading ?? this.isLoading,
      isExpanded: isExpanded ?? this.isExpanded,
      isWatching: isWatching ?? this.isWatching,
      // flickManager: flickManager ?? this.flickManager,
      chewieController: chewieController ?? this.chewieController,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        movie,
        isExpanded,
        isWatching,
        // if (flickManager != null) flickManager!,
        if (chewieController != null) chewieController!,
      ];
}

final class DetailErrorState extends DetailState {
  final String message;
  const DetailErrorState({
    this.message = '',
  });

  @override
  List<Object> get props => [message];
}
