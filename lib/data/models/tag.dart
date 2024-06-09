import 'package:medical_prescription/domain/entities/tag/tag.dart';

class TagModel extends TagEntity{
  const TagModel({required super.id, required super.name});

  factory TagModel.fromJson(Map<String, dynamic> map){
    return TagModel(
      id: map['id']?? 0,
      name: map['tagName']??""
    );
  }
}