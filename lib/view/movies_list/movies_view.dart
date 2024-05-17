import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_results_entity.dart';
import 'package:sample_movies_app_flutter/service_locator.dart';

import 'bloc/movies_page_bloc.dart';
import 'bloc/movies_page_event.dart';
import 'bloc/movies_page_state.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  //late MoviesPageBloc _moviesPageBloc;

  final PagingController<int, Results> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _initBloc();
    _pagingController.addPageRequestListener((pageKey) {
      context.read<MoviesPageBloc>().add(FetchEvent(pageKey));
    });
    super.initState();
  }

  void _initBloc() {
    //_moviesPageBloc = serviceLocator<MoviesPageBloc>();
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
            _pagingController.appendLastPage(state.movies?.results ?? []);
          } else {
            final nextPageKey = state.currentPage + 1;
            _pagingController.appendPage(
              state.movies?.results ?? [],
              nextPageKey,
            );
          }
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
          ),
          child: PagedListView<int, Results>.separated(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Results>(
              animateTransitions: true,
              noItemsFoundIndicatorBuilder: (context) => const Center(
                child: Text('No movies found.'),
              ),
              firstPageProgressIndicatorBuilder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
              itemBuilder: (context, item, index) => InkWell(
                onTap: () {
                  Results? movieDetails = state.movies?.results?[index];
                  context.go('/movie_details', extra: movieDetails);
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
              ),
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
        );
      },
    );
  }
}
