// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_movies_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrendingMoviesEntityAdapter extends TypeAdapter<TrendingMoviesEntity> {
  @override
  final int typeId = 2;

  @override
  TrendingMoviesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrendingMoviesEntity(
      movieId: fields[0] as int,
      movieTitle: fields[1] as String,
      moviePoster: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TrendingMoviesEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.movieId)
      ..writeByte(1)
      ..write(obj.movieTitle)
      ..writeByte(2)
      ..write(obj.moviePoster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrendingMoviesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
