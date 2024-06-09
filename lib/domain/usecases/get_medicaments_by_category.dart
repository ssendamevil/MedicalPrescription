import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/core/usecases/usecase.dart';
import 'package:medical_prescription/domain/entities/medicament/medicament.dart';
import 'package:medical_prescription/domain/entities/requestEntities/request_tag_id_entity.dart';
import 'package:medical_prescription/domain/repository/medicament_repository.dart';

class GetMedicamentsByCategoryUseCase implements UseCase<DataState<List<MedicamentEntity>>, RequestEntity<String>>{
  final MedicamentRepository _medicamentRepository;

  GetMedicamentsByCategoryUseCase(this._medicamentRepository);

  @override
  Future<DataState<List<MedicamentEntity>>> call({RequestEntity<String>? params}) async {
    return await _medicamentRepository.getMedicamentsByCategory(params!.fields);
  }


}