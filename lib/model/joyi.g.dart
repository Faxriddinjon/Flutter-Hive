// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joyi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JoyiAdapter extends TypeAdapter<Joyi> {
  @override
  final int typeId = 1;

  @override
  Joyi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Joyi(
      viloyat: fields[0] as String?,
      tuman: fields[1] as String?,
      qishloq: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Joyi obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.viloyat)
      ..writeByte(1)
      ..write(obj.tuman)
      ..writeByte(2)
      ..write(obj.qishloq);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JoyiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
