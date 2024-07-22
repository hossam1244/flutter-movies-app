import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_movies_app_flutter/view/home_page/home_page.dart';
import 'package:sample_movies_app_flutter/view/movies_details/movie_details_page.dart';
import 'package:sample_movies_app_flutter/view/movies_list/movies_page.dart';
import 'data/entities/movie_results_entity.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MoviesPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'movie_details',
          builder: (BuildContext context, GoRouterState state) {
            MoviesList? movieDetails = state.extra as MoviesList;
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
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      routerConfig: _router,
    );
  }
}
