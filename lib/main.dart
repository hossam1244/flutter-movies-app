import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_entity.dart';
import 'package:sample_movies_app_flutter/view/movies_list_page.dart';
import 'package:sample_movies_app_flutter/service_locator.dart'
    as serviceLocator;

import 'domain/entity/movie_results_entity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHive();
  await serviceLocator.init();
  runApp(const MyApp());
}

Future<void> initHive() async {
  // Initializing Hive
  await Hive.initFlutter();
  // Registering the adapters
  Hive.registerAdapter(MovieEntityAdapter());
  Hive.registerAdapter(ResultsAdapter());
  // Opening the box
  await Hive.openBox<MovieEntity>('moviesBox');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MoviesListPage(),
    );
  }
}
