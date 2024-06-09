import 'package:medical_prescription/data/models/medicament.dart';
import 'package:medical_prescription/data/models/prescription.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';

class OrderModel extends OrderEntity{
  const OrderModel({required super.id, required super.medicaments, required super.total, required super.prescription, required super.token});

  factory OrderModel.fromJson(Map<String, dynamic> map){
    return OrderModel(
      id: map['id'].toDouble() ?? 0.0,
      medicaments: (map['medicamentEntities'] as List)
          .map((i) => MedicamentModel.fromJson(i as Map<String, dynamic>))
          .toList(),
      prescription: PrescriptionModel.fromJson(map['prescription']),
      total: map['total'].toDouble() ?? 0.0,
      token: map['token'] ?? '',
    );
  }
}