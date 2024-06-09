import 'package:medical_prescription/data/models/tag.dart';
import 'package:medical_prescription/domain/entities/prescription/prescription.dart';

class PrescriptionModel extends PrescriptionEntity {
  const PrescriptionModel({
    required super.appointmentState,
    required super.expirationDate,
    required super.issueDate,
    required super.activeIngredients,
    required super.doctorId,
    required super.patientId,
    required super.id
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> map){
    return PrescriptionModel(
        appointmentState: map["status"] ?? "",
        expirationDate: '',
        issueDate: '',
        activeIngredients: (map['tags'] as List)
            .map((i) => TagModel.fromJson(i as Map<String, dynamic>))
            .toList() ?? [] ,
        doctorId: map["doctorId"]["id"] ?? 0,
        patientId: map["doctorId"]["id"] ?? 0,
        id: map["id"]?? 0

    );
  }

}