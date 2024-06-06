part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthLoginEvent extends AuthEvent{
  final String username;
  final String password;

  const AuthLoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [username];
}

class AuthLogoutEvent extends AuthEvent{

  @override
  List<Object?> get props => throw UnimplementedError();

}

class AuthVerifyTokenEvent extends AuthEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}
