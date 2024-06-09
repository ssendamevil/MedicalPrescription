import 'package:equatable/equatable.dart';

class RequestLoginEntity extends Equatable{
  final String iin;
  final String password;

  const RequestLoginEntity({required this.iin, required this.password});

  @override
  List<Object?> get props => [iin, password];

}