// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicament.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicamentEntityAdapter extends TypeAdapter<MedicamentEntity> {
  @override
  final int typeId = 3;

  @override
  MedicamentEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicamentEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      price: fields[2] as double,
      country: fields[3] as String,
      company: fields[4] as String,
      imageUrl: fields[5] as String,
      categories: (fields[6] as List).cast<String>(),
      tags: (fields[7] as List).cast<TagEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, MedicamentEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.company)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicamentEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
