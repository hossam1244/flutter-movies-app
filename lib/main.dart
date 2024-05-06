import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_entity.dart';
import 'package:sample_movies_app_flutter/service_locator.dart' as service_locator;

import 'domain/entity/movie_results_entity.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHive();
  await service_locator.init();
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

