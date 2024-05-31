import 'package:equatable/equatable.dart';

class PrescriptionEntity extends Equatable{
  final int id;
  final String appointmentState;
  final DateTime expirationDate;
  final DateTime issueDate;
  final List<String> activeIngredients;
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