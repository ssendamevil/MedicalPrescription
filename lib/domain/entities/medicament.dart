
import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 3)
class MedicamentEntity{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String country;
  @HiveField(4)
  final String company;


  MedicamentEntity(
    this.id,
    this.name,
    this.price,
    this.country,
    this.company,
  );
}

class MedicamentEntityAdapter extends TypeAdapter<MedicamentEntity>{
  @override
  MedicamentEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return MedicamentEntity(
        fields[0] as int,
        fields[1] as String,
        fields[2] as double,
        fields[3] as String,
        fields[4] as String
    );
  }

  @override
  final int typeId = 3;

  @override
  void write(BinaryWriter writer, MedicamentEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.company);
  }
  
}