import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_movies_app_flutter/view/favorites_page/favorites_view.dart';

import 'favorites_cubit/favorites_cubit.dart';


class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (_) => FavoritesCubit(),
          child: const FavoritesView(),
        ),
      ),
    );
  }
}


