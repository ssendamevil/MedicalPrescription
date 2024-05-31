import 'package:medical_prescription/domain/entities/user.dart';

import '../../core/resources/data_state.dart';

abstract class AuthRepository{
  Future<DataState<UserEntity>> login(String username, String password);
}