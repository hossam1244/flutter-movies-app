// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieEntityAdapter extends TypeAdapter<MovieEntity> {
  @override
  final int typeId = 1;

  @override
  MovieEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieEntity(
      page: fields[0] as int?,
      results: (fields[1] as List?)?.cast<Results>(),
      totalPages: fields[2] as int?,
      totalResults: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.results)
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
      other is MovieEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
