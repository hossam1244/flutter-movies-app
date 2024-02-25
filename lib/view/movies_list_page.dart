import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_movies_app_flutter/service_locator.dart';
import 'package:sample_movies_app_flutter/view/bloc/movies_page_event.dart';
import 'package:sample_movies_app_flutter/view/bloc/movies_page_state.dart';

import 'bloc/movies_page_bloc.dart';

class MoviesListPage extends StatefulWidget {
  const MoviesListPage({super.key});

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {

  late MoviesPageBloc _moviesPageBloc;


  @override
  void initState() {
    _moviesPageBloc = serviceLocator<MoviesPageBloc>();
    _moviesPageBloc.add(const FetchEvent());
    super.initState();
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
      child: Column(
        children: [
          BlocBuilder<MoviesPageBloc, MoviesPageState>(
            builder: (context, state) {
              if (state.status == MoviesPageStatus.initial) {
                return Container();
              } else if (state.status == MoviesPageStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == MoviesPageStatus.success) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(state.movies[index].title),
                        leading: Image.network(
                          state.movies[index].poster ?? "",
                          width: 100,
                          height: 100,
                        ),
                        trailing: const Icon(Icons.star),
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
        ],
      ),
    );
  }
}
