// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainMoviesEntityAdapter extends TypeAdapter<MainMoviesEntity> {
  @override
  final int typeId = 1;

  @override
  MainMoviesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainMoviesEntity(
      page: fields[0] as int?,
      moviesList: (fields[1] as List?)?.cast<MoviesList>(),
      totalPages: fields[2] as int?,
      totalResults: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MainMoviesEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.moviesList)
      ..writeByte(2)
      ..write(obj.totalPages)
      ..writeByte(3)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainMoviesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
