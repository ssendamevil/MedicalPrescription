import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/core/usecases/usecase.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';
import 'package:medical_prescription/domain/repository/order_repository.dart';

class GetOrdersByPatientUseCase extends UseCase<DataState<List<OrderEntity>>, void>{
  final OrderRepository _orderRepository;

  GetOrdersByPatientUseCase(this._orderRepository);

  @override
  Future<DataState<List<OrderEntity>>> call({void params}) async {
    return await _orderRepository.getAllPatientOrders();
  }

}