import 'package:equatable/equatable.dart';

class RequestLoginEntity extends Equatable{
  final String username;
  final String password;

  const RequestLoginEntity({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];

}