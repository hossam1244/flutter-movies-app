import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_movies_app_flutter/view/movies_list/bloc/movies_page_bloc.dart';
import 'package:sample_movies_app_flutter/view/movies_list/movies_view.dart';

class MoviesPage extends StatelessWidget  {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (BuildContext context) =>
              MoviesPageBloc(moviesUseCases: GetIt.instance()),
          child: const MoviesView(),
        ),
      ),
    );
  }
}
