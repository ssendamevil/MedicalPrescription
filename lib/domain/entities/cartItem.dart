import 'package:medical_prescription/domain/entities/medicament.dart';

class CartItemEntity{
  final String id;
  final MedicamentEntity medicamentEntity;
  int itemCount;

  CartItemEntity(this.id, this.medicamentEntity, this.itemCount);
}