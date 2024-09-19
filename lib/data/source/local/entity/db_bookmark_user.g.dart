// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_bookmark_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBBookmarkUserAdapter extends TypeAdapter<DBBookmarkUser> {
  @override
  final int typeId = 0;

  @override
  DBBookmarkUser read(BinaryReader reader) {
    return DBBookmarkUser();
  }

  @override
  void write(BinaryWriter writer, DBBookmarkUser obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.displayName)
      ..writeByte(1)
      ..write(obj.profileImage)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.reputation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBBookmarkUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
