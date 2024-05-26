import 'package:flutter/material.dart';

import '../../data/entities/movie_results_entity.dart';

class MoviesDetailsPage extends StatelessWidget {
  final MoviesList? movieDetails;

  const MoviesDetailsPage({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieDetails?.name ?? 'Movie Details Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _movieDetails(),
        ),
      ),
    );
  }

  Widget _movieDetails() {
    return Column(
      children: [
        Image.network(
          "https://image.tmdb.org/t/p/w500${movieDetails?.posterPath ?? ""}",
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 10),
        Text(movieDetails?.name ?? 'Movie Name'),
        const SizedBox(height: 10),
        Text(movieDetails?.overview ?? 'Movie Overview'),
        const SizedBox(height: 10),
        Text('Movie Rating: ${movieDetails?.voteAverage}'),
        const SizedBox(height: 10),
        Text('Release Date: ${movieDetails?.firstAirDate}'),
      ],
    );
  }
}
