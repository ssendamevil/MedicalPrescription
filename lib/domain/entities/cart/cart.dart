import 'package:hive_flutter/adapters.dart';
import 'package:medical_prescription/domain/entities/medicament/medicament.dart';

part 'cart.g.dart';

@HiveType(typeId: 2)
class CartEntity{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final MedicamentEntity medicamentEntity;
  @HiveField(2)
  int itemCount;
  @HiveField(3)
  final int prescriptionId;

  CartEntity(
    this.id,
    this.medicamentEntity,
    this.itemCount,
    this.prescriptionId
  );
}