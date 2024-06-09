part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class CreateOrderEvent extends OrderEvent{
  final List<int> medicaments;
  final int prescId;

  const CreateOrderEvent(this.medicaments, this.prescId);

  @override
  List<Object?> get props => [medicaments, prescId];
}

class GetAllOrdersByPatientEvent extends OrderEvent{
  @override
  List<Object?> get props => [];

}

class UpdateOrderItemEvent extends OrderEvent{
  final OrderEntity orderEntity;

  const UpdateOrderItemEvent(this.orderEntity);
  @override
  List<Object?> get props => [orderEntity];

}

