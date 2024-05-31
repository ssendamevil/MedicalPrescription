import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String iin;
  final String token;

  const UserEntity({required this.name, required this.iin, required this.token});

  @override
  List<Object?> get props => [name, iin, token];
}
