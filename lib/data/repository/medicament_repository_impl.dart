import 'dart:io';
import 'package:dio/dio.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/data/data_sources/remote/medicament/medicament_api_service.dart';
import 'package:medical_prescription/domain/entities/medicament/medicament.dart';
import 'package:medical_prescription/domain/repository/medicament_repository.dart';

class MedicamentRepositoryImpl extends MedicamentRepository{
  final MedicamentApiService _medicamentApiService;

  MedicamentRepositoryImpl(this._medicamentApiService);

  @override
  Future<DataState<List<MedicamentEntity>>> getMedicamentsByTagId(int id) async {
    try{
      final httpResponse = await _medicamentApiService.getMedicamentByTagId(id);
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

  @override
  Future<DataState<List<MedicamentEntity>>> getMedicamentsByCategory(String category) async {
    try{
      final httpResponse = await _medicamentApiService.getMedicamentByCategory(category);
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