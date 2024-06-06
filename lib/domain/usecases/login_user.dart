import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/core/usecases/usecase.dart';
import 'package:medical_prescription/domain/entities/requestEntities/RequestLoginEntity.dart';
import 'package:medical_prescription/domain/entities/user.dart';
import 'package:medical_prescription/domain/repository/auth_repository.dart';

class LoginUserUseCase implements UseCase<DataState<UserEntity>, RequestLoginEntity>{
  final AuthRepository _authRepository;

  LoginUserUseCase(this._authRepository);

  @override
  Future<DataState<UserEntity>> call({RequestLoginEntity ? params}) async {
    return await _authRepository.login(params!.username, params.password);
  }
  
}