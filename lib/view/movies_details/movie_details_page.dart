import 'package:flutter/material.dart';

class MoviesDetailsPage extends StatelessWidget {
  const MoviesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: const Center(
        child: Text('Movie Details'),
      ),
    );
  }
}
