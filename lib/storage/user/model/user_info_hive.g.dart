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
      gender: fields[0] as GenderHive,
      jobStatus: fields[1] as JobStatusHive,
      datingStatus: fields[2] as DatingStatusHive,
      birthdate: fields[3] as DateTime,
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

class GenderHiveAdapter extends TypeAdapter<GenderHive> {
  @override
  final int typeId = 2;

  @override
  GenderHive read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GenderHive.male;
      case 1:
        return GenderHive.female;
      default:
        return GenderHive.male;
    }
  }

  @override
  void write(BinaryWriter writer, GenderHive obj) {
    switch (obj) {
      case GenderHive.male:
        writer.writeByte(0);
        break;
      case GenderHive.female:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class JobStatusHiveAdapter extends TypeAdapter<JobStatusHive> {
  @override
  final int typeId = 3;

  @override
  JobStatusHive read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return JobStatusHive.student;
      case 1:
        return JobStatusHive.unemployed;
      case 2:
        return JobStatusHive.employed;
      default:
        return JobStatusHive.student;
    }
  }

  @override
  void write(BinaryWriter writer, JobStatusHive obj) {
    switch (obj) {
      case JobStatusHive.student:
        writer.writeByte(0);
        break;
      case JobStatusHive.unemployed:
        writer.writeByte(1);
        break;
      case JobStatusHive.employed:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobStatusHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DatingStatusHiveAdapter extends TypeAdapter<DatingStatusHive> {
  @override
  final int typeId = 1;

  @override
  DatingStatusHive read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DatingStatusHive.single;
      case 1:
        return DatingStatusHive.dating;
      case 2:
        return DatingStatusHive.married;
      default:
        return DatingStatusHive.single;
    }
  }

  @override
  void write(BinaryWriter writer, DatingStatusHive obj) {
    switch (obj) {
      case DatingStatusHive.single:
        writer.writeByte(0);
        break;
      case DatingStatusHive.dating:
        writer.writeByte(1);
        break;
      case DatingStatusHive.married:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatingStatusHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
