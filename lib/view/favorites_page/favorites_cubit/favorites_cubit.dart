import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository_impl.dart';

import 'favorites_state.dart';

// TODO get favorites from the repository
// TODO remove a favorite from the repository
class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState()) {
    getFavorites();
  }

  Future<void> getFavorites() async {
    emit(state.copyWith(loading: true));

    MoviesRepository favoritesRepository = MoviesRepositoryImpl(
        networkInfo: GetIt.instance(),
        moviesRemoteDataSource: GetIt.instance(),
        moviesLocalDataStorage: GetIt.instance());

    final favorites = await favoritesRepository.getMovies();
    emit(state.copyWith(loading: false, favorites: favorites));
  }
}
