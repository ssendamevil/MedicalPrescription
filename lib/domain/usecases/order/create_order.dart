import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/core/usecases/usecase.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';
import 'package:medical_prescription/domain/entities/requestEntities/request_tag_id_entity.dart';
import 'package:medical_prescription/domain/repository/order_repository.dart';

class CreateOrderUseCase extends UseCase<DataState<OrderEntity>, RequestEntity<Map<String, dynamic>>>{
  final OrderRepository _orderRepository;

  CreateOrderUseCase(this._orderRepository);

  @override
  Future<DataState<OrderEntity>> call({RequestEntity<Map<String, dynamic>>? params}) async {
    return await _orderRepository.createOrder(params?.fields.values.elementAt(0), params?.fields.values.elementAt(1));
  }

}