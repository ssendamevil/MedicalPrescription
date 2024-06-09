import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';

abstract class QrRepository{
  Future<DataState<OrderEntity>> scanQrCode(String token);
}