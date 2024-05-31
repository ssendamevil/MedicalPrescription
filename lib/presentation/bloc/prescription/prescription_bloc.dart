import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/domain/entities/prescription.dart';
import 'package:medical_prescription/domain/usecases/get_prescriptions.dart';

part 'prescription_event.dart';
part 'prescription_state.dart';

class PrescriptionBloc extends Bloc<PrescriptionEvent, PrescriptionState> {
  final GetPrescriptionsUseCase _getPrescriptionsUseCase;

  PrescriptionBloc(this._getPrescriptionsUseCase) : super(const PrescriptionState()) {
    on<GetAllPrscrpEvent>(_onGetAllPrescriptions);
  }

  Future<void> _onGetAllPrescriptions(GetAllPrscrpEvent event, Emitter<PrescriptionState> emitter) async {
    try{
      emit(state.copyWith(stateType: PrescriptionStateType.isLoading));
      final datastate = await _getPrescriptionsUseCase();
      if(datastate is DataSuccess){
        emit(state.copyWith(stateType: PrescriptionStateType.success, prscps: datastate.data));
      }
    }catch (e){
      emit(state.copyWith(stateType: PrescriptionStateType.failure));
    }
  }
}
