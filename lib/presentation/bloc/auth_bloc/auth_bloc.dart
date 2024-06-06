import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medical_prescription/core/error/response_error_entity.dart';
import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:medical_prescription/domain/entities/requestEntities/RequestLoginEntity.dart';
import 'package:medical_prescription/domain/entities/token.dart';
import 'package:medical_prescription/domain/entities/user.dart';
import '../../../domain/usecases/login_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase _loginUserUseCase;

  AuthBloc(this._loginUserUseCase) : super(const AuthState()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
    on<AuthVerifyTokenEvent>(_onVerifyToken);
  }

  Future<void> _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    try{
      emit(state.copyWith(stateType: AuthStateType.isLoading));
      final datastate = await _loginUserUseCase(params: RequestLoginEntity(username: event.username, password: event.password));
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
}
