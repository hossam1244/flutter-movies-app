import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String? poster;

  const MovieEntity({
    required this.title,
    required this.poster,
  });

  @override
  List<Object?> get props => [
        title,
        poster,
      ];
}