import 'package:medical_prescription/domain/entities/prescription.dart';

class PrescriptionModel extends PrescriptionEntity{

  PrescriptionModel({
    int ? id
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> map){
    return PrescriptionModel(
      id: map['id'] ?? "",
    );
  }
}