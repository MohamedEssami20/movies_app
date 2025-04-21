// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'up_coming_movies_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UpComingMoviesEntityAdapter extends TypeAdapter<UpComingMoviesEntity> {
  @override
  final int typeId = 4;

  @override
  UpComingMoviesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UpComingMoviesEntity(
      movieId: fields[0] as int,
      movieTitle: fields[1] as String,
      moviePoster: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UpComingMoviesEntity obj) {
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
      other is UpComingMoviesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
