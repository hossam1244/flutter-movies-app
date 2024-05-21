import 'package:equatable/equatable.dart';

sealed class MoviesPageEvent extends Equatable {
  const MoviesPageEvent();

  @override
  List<Object?> get props => [];
}

final class FetchEvent extends MoviesPageEvent {
  final int pageKey;
  const FetchEvent(this.pageKey);
}


final class AddToFavoritesEvent extends MoviesPageEvent {
  final int movieId;
  const AddToFavoritesEvent(this.movieId);
}
