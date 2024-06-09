part of 'order_bloc.dart';

enum OrderStateType {initial, isLoading, success, failure}

class OrderState extends Equatable {
  final OrderStateType stateType;
  final OrderEntity orderEntity;
  final List<OrderEntity> orders;

  const OrderState({
    this.orders = const [],
    this.orderEntity = const OrderEntity(
      id: -1,
      medicaments: [],
      total: 0,
      prescription: PrescriptionEntity(
        appointmentState: '',
        activeIngredients: [],
        expirationDate: '',
        patientId: 1,
        doctorId: 1,
        id: 1,
        issueDate: '',
      ),
      token: '',
    ),
    this.stateType = OrderStateType.initial
  });

  OrderState copyWith({
    OrderStateType? stateType,
    OrderEntity? orderEntity,
    List<OrderEntity> ? orders
  }){
    return OrderState(
      stateType: stateType ?? this.stateType,
      orderEntity: orderEntity ?? this.orderEntity,
      orders: orders ?? this.orders
    );
  }

  @override
  List<Object?> get props => [stateType, orderEntity, orders];
}
