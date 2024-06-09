import 'package:equatable/equatable.dart';
import 'package:medical_prescription/domain/entities/tag/tag.dart';

class PrescriptionEntity extends Equatable{
  final int id;
  final String appointmentState;
  final String expirationDate;
  final String issueDate;
  final List<TagEntity> activeIngredients;
  final int doctorId;
  final int patientId;

  const PrescriptionEntity({
    required this.appointmentState,
    required this.expirationDate,
    required this.issueDate,
    required this.activeIngredients,
    required this.doctorId,
    required this.patientId,
    required this.id
  });

  @override
  List<Object?> get props => [id, appointmentState, expirationDate, issueDate, activeIngredients, doctorId];
}