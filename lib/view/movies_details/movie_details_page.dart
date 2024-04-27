import 'package:flutter/material.dart';

class MoviesDetailsPage extends StatelessWidget {
  const MoviesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body:  Center(
        child: _movieDetails(),
      ),
    );
  }

  Widget _movieDetails() {
    return Column(
      children: [
        Image.network(""),
        const SizedBox(height: 10),
        Text('Movie Name'),
        const SizedBox(height: 10),
        Text('Movie Description'),
        const SizedBox(height: 10),
        Text('Movie Rating'),
        const SizedBox(height: 10),
        Text('Movie Release Date'),
      ],
    );
  }
}
