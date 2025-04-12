// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NowPlayingEntityAdapter extends TypeAdapter<NowPlayingEntity> {
  @override
  final int typeId = 0;

  @override
  NowPlayingEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NowPlayingEntity(
      moviesId: fields[0] as int,
      movieTitle: fields[1] as String,
      voteAveragemovie: fields[2] as double,
      movieImage: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NowPlayingEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.moviesId)
      ..writeByte(1)
      ..write(obj.movieTitle)
      ..writeByte(2)
      ..write(obj.voteAveragemovie)
      ..writeByte(3)
      ..write(obj.movieImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NowPlayingEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
