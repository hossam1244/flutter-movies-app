import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sample_movies_app_flutter/data/entities/movie_results_entity.dart';

import 'bloc/movies_page_bloc.dart';
import 'bloc/movies_page_event.dart';
import 'bloc/movies_page_state.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {

  final PagingController<int, MoviesList> _pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      context.read<MoviesPageBloc>().add(FetchEvent(pageKey));
    });
    super.initState();
  }


  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
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

  Widget buildBody(BuildContext context) {
    return BlocConsumer<MoviesPageBloc, MoviesPageState>(
      listener: (BuildContext context, MoviesPageState state) {
        if (state.status == MoviesPageStatus.success) {
          final isLastPage = state.hasReachedEnd;
          if (isLastPage) {
            _pagingController.appendLastPage(state.movies?.moviesList ?? []);
          } else {
            final nextPageKey = state.currentPage + 1;
            _pagingController.appendPage(
              state.movies?.moviesList ?? [],
              nextPageKey,
            );
          }
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () =>
              Future.sync(
                    () => _pagingController.refresh(),
              ),
          child: PagedListView<int, MoviesList>.separated(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<MoviesList>(
              animateTransitions: true,
              noItemsFoundIndicatorBuilder: (context) =>
              const Center(
                child: Text('No movies found.'),
              ),
              firstPageProgressIndicatorBuilder: (context) =>
              const Center(
                child: CircularProgressIndicator(),
              ),
              itemBuilder: (context, item, index) =>
                  InkWell(
                    onTap: () {
                      MoviesList? movieDetails = state.movies?.moviesList?[index];
                      context.go('/movie_details', extra: movieDetails);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(state.movies?.moviesList?[index].name ?? ""),
                        leading: Image.network(
                          "https://image.tmdb.org/t/p/w500${state.movies
                              ?.moviesList?[index].posterPath ?? ""}",
                          width: 100,
                          height: 100,
                        ),
                        trailing: (state.movies?.moviesList?[index].isFavorite ??
                            false) ? InkWell(
                              onTap: () {
                              },
                              child: const Icon(Icons.star)) : const Icon(Icons.star_border),
                      ),
                    ),
                  ),
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
        );
      },
    );
  }
}
