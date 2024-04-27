import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_movies_app_flutter/service_locator.dart';

import 'bloc/movies_page_bloc.dart';
import 'bloc/movies_page_event.dart';
import 'bloc/movies_page_state.dart';


class MoviesListPage extends StatefulWidget {
  const MoviesListPage({super.key});

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  late MoviesPageBloc _moviesPageBloc;

  @override
  void initState() {
    _initBloc();
    super.initState();
  }

  void _initBloc() {
    _moviesPageBloc = serviceLocator<MoviesPageBloc>();
  }

  void _fetchMovies() {
    _moviesPageBloc.add(const FetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<MoviesPageBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => _moviesPageBloc,
      child: BlocBuilder<MoviesPageBloc, MoviesPageState>(
        builder: (context, state) {
          if (state.status == MoviesPageStatus.initial) {
            _fetchMovies();
            return Container();
          } else if (state.status == MoviesPageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == MoviesPageStatus.success) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.movies?.results?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.go('/movie_details');
                  },  
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(state.movies?.results?[index].name ?? ""),
                      leading: Image.network(
                        "https://image.tmdb.org/t/p/w500${state.movies?.results?[index].posterPath ?? ""}",
                        width: 100,
                        height: 100,
                      ),
                      trailing: const Icon(Icons.star),
                    ),
                  ),
                );
              },
            );
          } else if (state.status == MoviesPageStatus.failure) {
            return const Center(
              child: Text("error..."),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
