import 'dart:io';

import 'package:dio/dio.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:medical_prescription/data/data_sources/remote/prescription/prescription_api_service.dart';
import 'package:medical_prescription/data/models/prescription.dart';
import '../../domain/repository/prescription_repository.dart';

class PrescriptionRepositoryImpl extends PrescriptionRepository{
  final PrescriptionApiService _prescriptionApiService;

  PrescriptionRepositoryImpl(this._prescriptionApiService);

  @override
  Future<DataState<List<PrescriptionModel>>> getPrescriptions() async {
    try{
      final httpResponse = await _prescriptionApiService.getAllPrescriptions('Bearer ${BoxHelper.getToken()?.access}');
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