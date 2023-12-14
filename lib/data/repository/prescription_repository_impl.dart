import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/data/models/prescription.dart';
import '../../domain/repository/prescription_repository.dart';

class PrescriptionRepositoryImpl extends PrescriptionRepository{
  @override
  Future<DataState<List<PrescriptionModel>>> getPrescriptions() {
    throw UnimplementedError();
  }

}