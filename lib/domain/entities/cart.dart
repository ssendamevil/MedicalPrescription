import 'package:hive_flutter/adapters.dart';
import 'package:medical_prescription/domain/entities/medicament.dart';

@HiveType(typeId: 2)
class CartEntity{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final MedicamentEntity medicamentEntity;
  @HiveField(2)
  int itemCount;

  CartEntity(
    this.id,
    this.medicamentEntity,
    this.itemCount
  );
}

class CartEntityAdapter extends TypeAdapter<CartEntity>{
  @override
  CartEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return CartEntity(
      fields[0] as String,
      fields[1] as MedicamentEntity,
      fields[2] as int
    );
  }

  @override
  final int typeId = 2;

  @override
  void write(BinaryWriter writer, CartEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.medicamentEntity)
      ..writeByte(2)
      ..write(obj.itemCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator == (Object other) =>
    identical(this, other) ||
      other is CartEntityAdapter &&
        runtimeType == other.runtimeType &&
        typeId == other.typeId;
}