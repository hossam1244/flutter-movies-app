import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_entity.dart';

import '../../../domain/usecase/movies_use_cases.dart';
import 'movies_page_event.dart';
import 'movies_page_state.dart';


class MoviesPageBloc extends Bloc<MoviesPageEvent, MoviesPageState> {
  MoviesUseCases _moviesUseCases;

  MoviesPageBloc({required MoviesUseCases moviesUseCases})
      : _moviesUseCases = moviesUseCases,
        super(const MoviesPageState()) {
    on<FetchEvent>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(
      FetchEvent event, Emitter<MoviesPageState> emit) async {
    emit(const MoviesPageState(status: MoviesPageStatus.loading));
    MovieEntity movies = await _moviesUseCases.getMovies();
    print(movies.results?.length);
    emit(MoviesPageState(status: MoviesPageStatus.success, movies: movies));
  }
}