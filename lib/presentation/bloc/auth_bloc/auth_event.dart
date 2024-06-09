part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthLoginEvent extends AuthEvent{
  final String iin;
  final String password;

  const AuthLoginEvent(this.iin, this.password);

  @override
  List<Object?> get props => [iin];
}

class AuthLogoutEvent extends AuthEvent{

  @override
  List<Object?> get props => throw UnimplementedError();

}

class AuthVerifyTokenEvent extends AuthEvent{
  @override
  List<Object?> get props => throw UnimplementedError();
}


class AuthRegistrationEvent extends AuthEvent{
  final String iin;
  final String password;
  final String confirmPassword;
  final String username;
  final String phoneNumber;
  final String userSecondName;
  final String userThirdName;

  const AuthRegistrationEvent(this.iin, this.password, this.confirmPassword, this.username,  this.userSecondName, this.userThirdName, this.phoneNumber,);

  @override
  List<Object?> get props => [iin, username, userThirdName, userSecondName];
}