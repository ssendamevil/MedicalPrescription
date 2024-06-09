import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_prescription/core/error/response_error_entity.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:medical_prescription/domain/entities/requestEntities/request_login_entity.dart';
import 'package:medical_prescription/domain/entities/requestEntities/request_registration_entity.dart';
import 'package:medical_prescription/domain/entities/token/token.dart';
import 'package:medical_prescription/domain/entities/user/user.dart';
import 'package:medical_prescription/domain/usecases/registration_user.dart';
import '../../../domain/usecases/login_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase _loginUserUseCase;
  final RegisterUserUseCase _registerUserUseCase;

  AuthBloc(this._loginUserUseCase, this._registerUserUseCase) : super(const AuthState()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
    on<AuthVerifyTokenEvent>(_onVerifyToken);
    on<AuthRegistrationEvent>(_onRegistration);
  }

  Future<void> _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    try{
      emit(state.copyWith(stateType: AuthStateType.isLoading));
      final datastate = await _loginUserUseCase(params: RequestLoginEntity(iin: event.iin, password: event.password));
      if(datastate is DataSuccess) {
        BoxHelper.saveToken(TokenEntity(datastate.data!.token));
        emit(state.copyWith(stateType: AuthStateType.success, user: datastate.data, signedType: SignedType.signed));
      }else{
        emit(state.copyWith(
          stateType: AuthStateType.failure,
          responseErrorEntity: ResponseErrorEntity(
              msg: datastate.error?.response!.data["message"],
              statusCode: datastate.error.hashCode
          )
        ));
      }
    }on Exception catch (e){
      emit(state.copyWith(stateType: AuthStateType.failure, responseErrorEntity: ResponseErrorEntity(msg: e.toString() , statusCode: 0)));
    }
  }

  Future<void> _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    try{
      emit(state.copyWith(stateType: AuthStateType.isLoading));
      BoxHelper.deleteToken();
      emit(state.copyWith(stateType: AuthStateType.success, signedType: SignedType.notSigned));
    }catch (e){
      emit(state.copyWith(stateType: AuthStateType.failure));
    }
  }

  Future<void> _onVerifyToken(AuthVerifyTokenEvent event, Emitter<AuthState> emit) async {
    try{
      emit(state.copyWith(stateType: AuthStateType.isLoading));
      emit(state.copyWith(stateType: AuthStateType.success));
    }catch (e){
      emit(state.copyWith(stateType: AuthStateType.failure));
    }
  }

  Future<void> _onRegistration(AuthRegistrationEvent event, Emitter<AuthState> emit) async {
    try{
      emit(state.copyWith(stateType: AuthStateType.isLoading));
      final datastate = await _registerUserUseCase(
        params: RequestRegistrationEntity(
          iin: event.iin,
          password: event.password,
          confirmPassword: event.confirmPassword,
          username: event.username,
          phoneNumber: event.phoneNumber,
          userSecondName: event.userSecondName,
          userThirdName: event.userThirdName,
        )
      );
      if(datastate is DataSuccess) {
        BoxHelper.saveToken(TokenEntity(datastate.data!.token));
        emit(state.copyWith(stateType: AuthStateType.success, user: datastate.data, signedType: SignedType.signed));
      }else{
        emit(state.copyWith(
            stateType: AuthStateType.failure,
            responseErrorEntity: ResponseErrorEntity(
                msg: datastate.error?.response!.data["message"],
                statusCode: datastate.error.hashCode
            )
        ));
      }
    }on Exception catch (e){
      emit(state.copyWith(stateType: AuthStateType.failure, responseErrorEntity: ResponseErrorEntity(msg: e.toString() , statusCode: 0)));
    }
  }
}
