import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/domain/entities/user/user.dart';


abstract class AuthRepository{
  Future<DataState<UserEntity>> login(String iin, String password);

  Future<DataState<UserEntity>> registration(String iin, String password,String confirmPass, String username, String userSecondName, String userThirdName,String phoneNumber);
}