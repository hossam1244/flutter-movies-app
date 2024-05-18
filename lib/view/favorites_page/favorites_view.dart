import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_movies_app_flutter/view/favorites_page/favorites_cubit/favorites_cubit.dart';
import 'package:sample_movies_app_flutter/view/favorites_page/favorites_cubit/favorites_state.dart';



class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Center(
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return state.loading
                ? const CircularProgressIndicator()
                : state.favorites != null
                    ? ListView.builder(
                        itemCount: state.favorites!.results!.length,
                        itemBuilder: (context, index) {
                          final movie = state.favorites!.results![index];
                          return ListTile(
                              leading: Image.network(
                                'https://image.tmdb.org/t/p/w92${movie.posterPath}',
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                movie.name ?? '',
                                style: textTheme.headline6,
                              ),
                              subtitle: Text(
                                movie.overview ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {},
                              ));
                        },
                      )
                    : const Text(
                        'No favorites yet!',
                      );
          },
        ),
      ),
    );
  }
}
