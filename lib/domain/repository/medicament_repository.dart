import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/domain/entities/medicament/medicament.dart';

abstract class MedicamentRepository{
  Future<DataState<List<MedicamentEntity>>> getMedicamentsByTagId(int id);
  Future<DataState<List<MedicamentEntity>>> getMedicamentsByCategory(String category);
}