import 'package:medical_prescription/domain/entities/prescription.dart';
import '../../core/resources/data_state.dart';

abstract class PrescriptionRepository {
  Future<DataState<List<PrescriptionEntity>>> getPrescriptions();
}