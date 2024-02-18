import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_movies_app_flutter/view/bloc/movies_page_event.dart';
import 'package:sample_movies_app_flutter/view/bloc/movies_page_state.dart';

class MoviesPageBloc extends Bloc<MoviesPageEvent, MoviesPageState> {

  MoviesPageBloc() : super(const MoviesPageState()) {
    on<FetchEvent>(_onFetch);
  }
  


  void _onFetch(FetchEvent event, Emitter<MoviesPageState> emit) {

  }
}
