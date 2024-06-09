import 'dart:io';
import 'package:dio/dio.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/data/data_sources/remote/auth/auth_api_service.dart';
import 'package:medical_prescription/data/models/user.dart';
import 'package:medical_prescription/domain/entities/user/user.dart';
import 'package:medical_prescription/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState<UserModel>> login(String iin, String password) async {
    try{
      final httpResponse = await _authApiService.loginUser(iin: iin, password: password);
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
  Future<DataState<UserEntity>> registration(String iin, String password, String confirmPass, String username, String userSecondName, String userThirdName, String phoneNumber) async {
    try{
      final httpResponse = await _authApiService.registerUser(iin: iin, password: password, username: username, userSecondName: userSecondName, userThirdName: userThirdName, confirmPassword: confirmPass, phone_number: phoneNumber);
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