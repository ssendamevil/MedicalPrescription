import 'package:equatable/equatable.dart';

class RequestRegistrationEntity extends Equatable{
  final String iin;
  final String password;
  final String confirmPassword;
  final String username;
  final String phoneNumber;
  final String userSecondName;
  final String userThirdName;

  const RequestRegistrationEntity({required this.confirmPassword, required this.username, required this.phoneNumber, required this.userSecondName, required this.userThirdName, required this.iin, required this.password});

  @override
  List<Object?> get props => [iin, password, confirmPassword, username, userSecondName, userThirdName, phoneNumber];

}