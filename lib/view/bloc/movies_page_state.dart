import 'package:equatable/equatable.dart';

import '../../data/models/movie_model.dart';
import '../../domain/entity/movie_entity.dart';

enum MoviesPageStatus { initial, loading, success, failure }

class MoviesPageState extends Equatable {
  const MoviesPageState({
    this.status = MoviesPageStatus.initial,
    this.movies = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
  });

  final MoviesPageStatus status;
  final List<MovieEntity> movies;
  final bool hasReachedEnd;
  final int currentPage;

  MoviesPageState copyWith({
    MoviesPageStatus? status,
    List<MovieEntity>? movies,
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
    movies,
    hasReachedEnd,
    currentPage,
  ];
}