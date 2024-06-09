import 'dart:io';

import 'package:dio/dio.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:medical_prescription/data/data_sources/remote/order/order_api_service.dart';
import 'package:medical_prescription/data/models/order.dart';
import 'package:medical_prescription/domain/repository/order_repository.dart';

class OrderRepositoryImpl extends OrderRepository{
  final OrderApiService _orderApiService;

  OrderRepositoryImpl(this._orderApiService);

  @override
  Future<DataState<OrderModel>> createOrder(List<int> medicaments, int prescriptionId) async {
    try{
      final httpResponse = await _orderApiService.createOrder(medicaments: medicaments, prescriptionId: prescriptionId);
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
    } on DioError catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<OrderModel>>> getAllPatientOrders() async {
    try{
      final httpResponse = await _orderApiService.getAllPatientOrders('Bearer ${BoxHelper.getToken()?.access}');
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