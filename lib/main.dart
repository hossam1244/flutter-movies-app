import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_movies_app_flutter/bloc_observer.dart';
import 'package:sample_movies_app_flutter/data/entities/movie_entity.dart';
import 'package:sample_movies_app_flutter/data/entities/movie_results_entity.dart';
import 'package:sample_movies_app_flutter/service_locator.dart' as service_locator;

import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHive();
  await service_locator.init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}



Future<void> initHive() async {
  // Initializing Hive
  await Hive.initFlutter();
  // Registering the adapters
  Hive.registerAdapter(MainMoviesEntityAdapter());
  Hive.registerAdapter(MoviesListAdapter());
  // Opening the box
  await Hive.openBox<MainMoviesEntity>('moviesBox');

  // TODO create a box for saving favorites movies
}

