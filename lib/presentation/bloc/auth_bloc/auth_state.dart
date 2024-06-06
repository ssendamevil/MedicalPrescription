part of 'auth_bloc.dart';

enum AuthStateType {initial, isLoading, success, failure}
enum SignedType {signed, notSigned}

class AuthState extends Equatable{
  final AuthStateType stateType;
  final UserEntity user;
  final SignedType signedType;
  final ResponseErrorEntity error;

  const AuthState({
    this.signedType = SignedType.notSigned,
    this.stateType = AuthStateType.initial,
    this.user = const UserEntity(name: '', iin: '', token: ''),
    this.error = const ResponseErrorEntity(msg: "", statusCode:0)
  });

  AuthState copyWith({
    AuthStateType? stateType,
    UserEntity? user,
    SignedType? signedType,
    ResponseErrorEntity? responseErrorEntity
  }){
    return AuthState(
      stateType: stateType ?? this.stateType,
      user: user ?? this.user,
      signedType: signedType ?? this.signedType,
      error: responseErrorEntity ?? error
    );
  }

  @override
  List<Object?> get props => [stateType, signedType, error];
}
