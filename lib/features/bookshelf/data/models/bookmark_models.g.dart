// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkModelsAdapter extends TypeAdapter<BookmarkModels> {
  @override
  final int typeId = 1;

  @override
  BookmarkModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookmarkModels(
      title: fields[0] as String?,
      description: fields[1] as String?,
      key: fields[2] as String?,
      authors: fields[3] as String?,
      fav: fields[4] as bool?,
      coverI: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookmarkModels obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.key)
      ..writeByte(3)
      ..write(obj.authors)
      ..writeByte(4)
      ..write(obj.fav)
      ..writeByte(5)
      ..write(obj.coverI);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
