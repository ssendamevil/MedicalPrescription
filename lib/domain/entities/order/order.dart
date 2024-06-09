import 'package:equatable/equatable.dart';
import 'package:medical_prescription/domain/entities/medicament/medicament.dart';
import 'package:medical_prescription/domain/entities/prescription/prescription.dart';

class OrderEntity extends Equatable{
  final double id;
  final List<MedicamentEntity> medicaments;
  final double total;
  final PrescriptionEntity prescription;
  final String token;

  const OrderEntity({
    required this.id,
    required this.medicaments,
    required this.total,
    required this.prescription,
    required this.token
  });


  @override
  List<Object?> get props => [id, medicaments, total, prescription, token];

}