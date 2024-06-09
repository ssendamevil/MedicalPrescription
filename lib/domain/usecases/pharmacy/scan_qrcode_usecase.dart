import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/core/usecases/usecase.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';
import 'package:medical_prescription/domain/entities/requestEntities/request_tag_id_entity.dart';
import 'package:medical_prescription/domain/repository/pharmacy/qr_repository.dart';

class ScanQrCodeUseCase implements UseCase<DataState<OrderEntity>, RequestEntity<String>>{
  final QrRepository _qrRepository;

  ScanQrCodeUseCase(this._qrRepository);

  @override
  Future<DataState<OrderEntity>> call({RequestEntity<String>? params}) async {
    return await _qrRepository.scanQrCode(params!.fields);
  }

}