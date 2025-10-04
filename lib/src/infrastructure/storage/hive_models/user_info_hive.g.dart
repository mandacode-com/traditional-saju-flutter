// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoHiveAdapter extends TypeAdapter<UserInfoHive> {
  @override
  final int typeId = 0;

  @override
  UserInfoHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfoHive(
      gender: fields[0] as String,
      jobStatus: fields[1] as String,
      datingStatus: fields[2] as String,
      birthdate: fields[3] as String,
      permanent: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserInfoHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.jobStatus)
      ..writeByte(2)
      ..write(obj.datingStatus)
      ..writeByte(3)
      ..write(obj.birthdate)
      ..writeByte(4)
      ..write(obj.permanent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
