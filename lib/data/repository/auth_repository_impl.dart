import 'dart:io';
import 'package:dio/dio.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/data/data_sources/remote/auth/auth_api_service.dart';
import 'package:medical_prescription/data/models/user.dart';
import 'package:medical_prescription/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<UserModel>> login(String username, String password) async {
    try{
      final httpResponse = await _authApiService.loginUser(username: username, password: password);
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

}