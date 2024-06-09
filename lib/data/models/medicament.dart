import 'package:medical_prescription/data/models/tag.dart';
import 'package:medical_prescription/domain/entities/medicament/medicament.dart';

class MedicamentModel extends MedicamentEntity{
  const MedicamentModel({required super.id, required super.name, required super.price, required super.country, required super.company, required super.imageUrl, required super.categories, required super.tags});

  factory MedicamentModel.fromJson(Map<String, dynamic> map){
    return MedicamentModel(
      id: map['id']?? 0,
      name: map['medName']?? "",
      price: map['price'].toDouble() ?? 0.0,
      country: map['country']?? '',
      company: map['producer']?? '',
      imageUrl: map['imageUrl']?? '',
      categories: map['categories']?? [],
      tags: (map['tags'] as List)
          .map((i) => TagModel.fromJson(i as Map<String, dynamic>))
          .toList() ?? []
    );
  }

}