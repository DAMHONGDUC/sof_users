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
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBBookmarkUser()
      ..id = fields[0] as int
      ..profileImage = fields[1] as String?
      ..location = fields[2] as String?
      ..reputation = fields[3] as int?
      ..displayName = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, DBBookmarkUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.profileImage)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.reputation)
      ..writeByte(4)
      ..write(obj.displayName);
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
