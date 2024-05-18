import 'package:equatable/equatable.dart';

import '../../../domain/entity/movie_entity.dart';

final class FavoritesState extends Equatable {
  final int count;
  final bool loading;
  final MovieEntity? favorites;

  const FavoritesState({this.count = 0, this.loading = false, this.favorites});

  FavoritesState copyWith({
    int? count,
    bool? loading,
    MovieEntity? favorites,
  }) {
    return FavoritesState(
      count: count ?? this.count,
      loading: loading ?? this.loading,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object> get props => [count, loading];
}