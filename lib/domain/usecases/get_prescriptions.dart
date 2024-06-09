import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/core/usecases/usecase.dart';
import 'package:medical_prescription/domain/entities/prescription/prescription.dart';
import 'package:medical_prescription/domain/repository/prescription_repository.dart';

class GetPrescriptionsUseCase implements UseCase<DataState<List<PrescriptionEntity>>, void>{
  final PrescriptionRepository _prescriptionRepository;

  GetPrescriptionsUseCase(this._prescriptionRepository);

  @override
  Future<DataState<List<PrescriptionEntity>>> call({void params}) async {
    return await _prescriptionRepository.getPrescriptions();
  }

}