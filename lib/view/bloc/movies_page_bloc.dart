import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_movies_app_flutter/view/bloc/movies_page_event.dart';
import 'package:sample_movies_app_flutter/view/bloc/movies_page_state.dart';

import '../../domain/usecase/movies_use_cases.dart';

class MoviesPageBloc extends Bloc<MoviesPageEvent, MoviesPageState> {
  MoviesUseCases _moviesUseCases;

  MoviesPageBloc({required MoviesUseCases moviesUseCases}) :
        _moviesUseCases = moviesUseCases,
        super(const MoviesPageState()) {
    on<FetchEvent>(_onFetchMovies);
  }
  


  void _onFetchMovies(FetchEvent event, Emitter<MoviesPageState> emit) {

  }
}
