import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'tag.g.dart';

@HiveType(typeId: 4)
class TagEntity extends Equatable{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  const TagEntity({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

}