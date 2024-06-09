import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/domain/entities/cart/cart.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';
import 'package:medical_prescription/domain/entities/prescription/prescription.dart';
import 'package:medical_prescription/domain/entities/requestEntities/request_tag_id_entity.dart';
import 'package:medical_prescription/domain/usecases/order/create_order.dart';
import 'package:medical_prescription/domain/usecases/order/get_orders_by_patient.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CreateOrderUseCase _createOrderUseCase;
  final GetOrdersByPatientUseCase _getOrdersByPatientUseCase;

  OrderBloc(this._createOrderUseCase, this._getOrdersByPatientUseCase) : super(const OrderState()) {
    on<CreateOrderEvent>(_onCreateOrder);
    on<GetAllOrdersByPatientEvent>(_onGetAllOrdersByPatient);
    on<UpdateOrderItemEvent>(_onUpdateOrderItem);
  }

  Future<void> _onCreateOrder(CreateOrderEvent event, Emitter<OrderState> emit)async {
    try{
      emit(state.copyWith(stateType: OrderStateType.isLoading));
      final datastate = await _createOrderUseCase(params: RequestEntity(fields: {"medicaments": event.medicaments, "prescriptionId": event.prescId}));
      if(datastate is DataSuccess) {
        emit(state.copyWith(stateType: OrderStateType.success,orderEntity: datastate.data));
      }else{
        emit(state.copyWith(stateType: OrderStateType.failure));
      }
    }on Exception catch (e){
      emit(state.copyWith(stateType: OrderStateType.failure));
    }
  }

  Future<void> _onGetAllOrdersByPatient(GetAllOrdersByPatientEvent event, Emitter<OrderState> emit)async {
    try{
      emit(state.copyWith(stateType: OrderStateType.isLoading));
      final datastate = await _getOrdersByPatientUseCase();
      if(datastate is DataSuccess) {
        emit(state.copyWith(stateType: OrderStateType.success,orders: datastate.data));
      }else{
        emit(state.copyWith(stateType: OrderStateType.failure));
      }
    }on Exception catch (e){
      emit(state.copyWith(stateType: OrderStateType.failure));
    }
  }

  void _onUpdateOrderItem(UpdateOrderItemEvent event, Emitter<OrderState> emit){
    emit(state.copyWith(orderEntity: event.orderEntity));
  }
}


