import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_movies_app_flutter/view/movies_details/movie_details_page.dart';
import 'package:sample_movies_app_flutter/view/movies_list/movies_list_page.dart';

import 'domain/entity/movie_entity.dart';
import 'domain/entity/movie_results_entity.dart';

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MoviesListPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'movie_details',
          builder: (BuildContext context, GoRouterState state) {
            Results? movieDetails = state.extra as Results;
            return MoviesDetailsPage(
              movieDetails: movieDetails,
            );
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
