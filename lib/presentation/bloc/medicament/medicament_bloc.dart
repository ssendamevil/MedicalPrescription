import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_prescription/domain/entities/medicament/medicament.dart';
import 'package:medical_prescription/domain/entities/requestEntities/request_tag_id_entity.dart';
import 'package:medical_prescription/domain/usecases/get_medicaments_by_category.dart';
import 'package:medical_prescription/domain/usecases/get_medicaments_by_tag.dart';
import 'package:meta/meta.dart';
import '../../../core/resources/data_state.dart';

part 'medicament_event.dart';
part 'medicament_state.dart';

class MedicamentBloc extends Bloc<MedicamentEvent, MedicamentState> {
  final GetMedicamentsByTagUseCase _getMedicamentsByTagUseCase;
  final GetMedicamentsByCategoryUseCase _byCategoryUseCase;

  MedicamentBloc(this._getMedicamentsByTagUseCase, this._byCategoryUseCase) : super(const MedicamentState()) {
    on<GetMedicsByTagIdEvent>(_onGetAllMedicsByTagId);
    on<GetMedicsByCategoryEvent>(_onGetAllMedicsByCategory);
  }

  Future<void> _onGetAllMedicsByTagId(GetMedicsByTagIdEvent event, Emitter<MedicamentState> emit )async {
    try{
      emit(state.copyOf(state: MedicamentStateType.inProgress));
      final datastate = await _getMedicamentsByTagUseCase(params: RequestEntity(fields: event.id));
      if(datastate is DataSuccess){
        emit(state.copyOf(state: MedicamentStateType.success, medicaments: datastate.data));
      }else{
        emit(state.copyOf(state: MedicamentStateType.failure));
      }
    }catch(e){
      emit(state.copyOf(state: MedicamentStateType.failure));
    }
  }

  Future<void> _onGetAllMedicsByCategory(GetMedicsByCategoryEvent event, Emitter<MedicamentState> emit )async {
    try{
      emit(state.copyOf(state: MedicamentStateType.inProgress));
      final datastate = await _byCategoryUseCase(params: RequestEntity(fields: event.category));
      if(datastate is DataSuccess){
        emit(state.copyOf(state: MedicamentStateType.success, medicaments: datastate.data));
      }else{
        emit(state.copyOf(state: MedicamentStateType.failure));
      }
    }catch(e){
      emit(state.copyOf(state: MedicamentStateType.failure));
    }
  }
}
