import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';
import 'package:medical_prescription/domain/entities/prescription/prescription.dart';
import 'package:medical_prescription/domain/entities/requestEntities/request_tag_id_entity.dart';
import 'package:medical_prescription/domain/usecases/pharmacy/scan_qrcode_usecase.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  final ScanQrCodeUseCase _scanQrCodeUseCase;

  QrBloc(this._scanQrCodeUseCase) : super(const QrState()) {
    on<ScanQrCodeEvent>(_onScanQrCodeEvent);
  }


  Future<void> _onScanQrCodeEvent(ScanQrCodeEvent event, Emitter<QrState> emit) async {
    try{
      emit(state.copyWith(stateType: QrStateType.isLoading));
      final datastate = await _scanQrCodeUseCase(params: RequestEntity(fields: event.token));
      if(datastate is DataSuccess) {
        emit(state.copyWith(stateType: QrStateType.success,orderEntity: datastate.data));
      }else{
        emit(state.copyWith(stateType: QrStateType.failure));
      }
    }on Exception catch (e){
      emit(state.copyWith(stateType: QrStateType.failure));
    }
  }
}
