import 'package:equatable/equatable.dart';

import '../../../domain/entity/movie_entity.dart';

enum MoviesPageStatus { initial, loading, success, failure }

class MoviesPageState extends Equatable {
   const MoviesPageState({
    this.status = MoviesPageStatus.initial,
    this.movies,
    this.hasReachedEnd = false,
    this.currentPage = 1,
  });

  final MoviesPageStatus status;
  final MovieEntity? movies;
  final bool hasReachedEnd;
  final int currentPage;

  MoviesPageState copyWith({
    MoviesPageStatus? status,
    MovieEntity? movies,
    bool? hasReachedEnd,
    int? currentPage,
  }) {
    return MoviesPageState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [
    status,
    movies ?? MovieEntity(),
    hasReachedEnd,
    currentPage,
  ];
}