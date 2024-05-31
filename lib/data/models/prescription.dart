import 'package:medical_prescription/domain/entities/prescription.dart';

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
        expirationDate: DateTime(2024),
        issueDate: DateTime(2023),
        activeIngredients: ["1"] ,
        doctorId: map["doctorId"]["id"] ?? 0,
        patientId: map["doctorId"]["id"] ?? 0,
        id: map["id"]?? 0

    );
  }

}