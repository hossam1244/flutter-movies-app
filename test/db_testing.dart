import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_entity.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_results_entity.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    if (Hive.isAdapterRegistered(1) == false) {
      Hive.registerAdapter(MovieEntityAdapter());
      Hive.registerAdapter(ResultsAdapter());
    }
  });

  group("movies_box_testing", () {
    test("movies_db_closed", () {
      expect(Hive.isBoxOpen('moviesBox'), false);
    });

    test("movies_db_open", () async {
      const MethodChannel channel =
          MethodChannel('plugins.flutter.io/path_provider');
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
        return ".";
      });
      Hive.init((await getApplicationDocumentsDirectory()).path);
      await Hive.openBox<MovieEntity>('moviesBox');
      expect(Hive.isBoxOpen('moviesBox'), true);
    });

    test("movies_db_closed", () async {
      await Hive.close();
      expect(Hive.isBoxOpen('moviesBox'), false);
    });

    test("movies_db_open", () async {
      Hive.init((await getApplicationDocumentsDirectory()).path);
      await Hive.openBox<MovieEntity>('moviesBox');
      expect(Hive.isBoxOpen('moviesBox'), true);
    });

    test("add_movies", () {
      final box = Hive.box<MovieEntity>('moviesBox');
      final movie = MovieEntity(
          page: 1,
          results: [
            Results(
                adult: false,
                backdropPath: "/8Y43POKjjKDGI9MH89NW0NAzzp8.jpg",
                genreIds: [28, 12, 14],
                id: 566525,
                originalLanguage: "en",
                overview:
                    "Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.",
                popularity: 2075.735,
                posterPath: "/1BIoJGKbXjdFDAqUEiA2VHqkKj5.jpg",
                name: "Shang-Chi and the Legend of the Ten Rings",
                voteAverage: 7.8,
                voteCount: 2935)
          ],
          totalPages: 100,
          totalResults: 2000);
      box.put('movies', movie);
      expect(box.get('movies'), movie);
    });
  });
}
