import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';

abstract class OrderRepository{
  Future<DataState<OrderEntity>> createOrder(List<int> medicaments, int prescriptionId);

  Future<DataState<List<OrderEntity>>> getAllPatientOrders();
}