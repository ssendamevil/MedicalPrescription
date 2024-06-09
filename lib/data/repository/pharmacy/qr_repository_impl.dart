import 'dart:io';
import 'package:dio/dio.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/data/data_sources/remote/pharmacy/qr_api_service.dart';
import 'package:medical_prescription/data/models/order.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';
import 'package:medical_prescription/domain/repository/pharmacy/qr_repository.dart';

class QrRepositoryImpl extends QrRepository{
  final QrApiService _qrApiService;

  QrRepositoryImpl(this._qrApiService);

  @override
  Future<DataState<OrderModel>> scanQrCode(String token) async {
    try{
      final httpResponse = await _qrApiService.scanQrCode(token);
      if(httpResponse.response.statusCode == HttpStatus.ok){
        return DataSuccess(httpResponse.data);
      }else{
        return DataFailed(
            DioError(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioErrorType.response,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    }on DioError catch(e){
      return DataFailed(e);
    }
  }

}