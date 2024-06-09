import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/domain/entities/prescription/prescription.dart';
import 'package:medical_prescription/domain/usecases/get_prescriptions.dart';

part 'prescription_event.dart';
part 'prescription_state.dart';

class PrescriptionBloc extends Bloc<PrescriptionEvent, PrescriptionState> {
  final GetPrescriptionsUseCase _getPrescriptionsUseCase;

  PrescriptionBloc(this._getPrescriptionsUseCase) : super(const PrescriptionState()) {
    on<GetAllPrscrpEvent>(_onGetAllPrescriptions);
  }

  Future<void> _onGetAllPrescriptions(GetAllPrscrpEvent event, Emitter<PrescriptionState> emit) async {

    List<PrescriptionEntity> activePrescriptions = [];
    List<PrescriptionEntity> inactivePrescriptions = [];
    List<PrescriptionEntity> handedPrescriptions = [];
    List<PrescriptionEntity> expiredPrescriptions = [];

    try{
      emit(state.copyWith(stateType: PrescriptionStateType.isLoading));
      final datastate = await _getPrescriptionsUseCase();
      if(datastate is DataSuccess){
         datastate.data?.map((pres){
          if(pres.appointmentState=="ACTIVE"){
            activePrescriptions.add(pres);
          }else if(pres.appointmentState=="HANDED"){
            handedPrescriptions.add(pres);
          }else if(pres.appointmentState=="EXPIRED"){
            expiredPrescriptions.add(pres);
          }else{
            inactivePrescriptions.add(pres);
          }
        }).toList();

        emit(state.copyWith(
          stateType: PrescriptionStateType.success,
          prscps: datastate.data,
          activePrescriptions: activePrescriptions,
          inactivePrescriptions: inactivePrescriptions,
          handedPrescriptions: handedPrescriptions,
          expiredPrescriptions: expiredPrescriptions
        ));

      }
    }catch (e){
      emit(state.copyWith(stateType: PrescriptionStateType.failure));
    }
  }
}
