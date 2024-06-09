import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_prescription/domain/entities/tag/tag.dart';

part 'medicament.g.dart';

@HiveType(typeId: 3)
class MedicamentEntity extends Equatable{
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
  @HiveField(5)
  final String imageUrl;
  @HiveField(6)
  final List<String> categories;
  @HiveField(7)
  final List<TagEntity> tags;


  const MedicamentEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.country,
    required this.company,
    required this.imageUrl,
    required this.categories,
    required this.tags,
  });

  @override
  List<Object?> get props => [id, name, price, country, company, imageUrl, categories, tags];
}

/*
class MedicamentEntityAdapter extends TypeAdapter<MedicamentEntity>{
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

}*/
