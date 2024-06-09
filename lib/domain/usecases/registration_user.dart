import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/core/usecases/usecase.dart';
import 'package:medical_prescription/domain/entities/requestEntities/request_registration_entity.dart';
import 'package:medical_prescription/domain/entities/user/user.dart';
import 'package:medical_prescription/domain/repository/auth_repository.dart';

class RegisterUserUseCase implements UseCase<DataState<UserEntity>, RequestRegistrationEntity>{
  final AuthRepository _authRepository;

  RegisterUserUseCase(this._authRepository);

  @override
  Future<DataState<UserEntity>> call({RequestRegistrationEntity ? params}) async {
    return await _authRepository.registration(
      params!.iin,
      params!.password,
      params!.confirmPassword,
      params!.username,
      params!.userSecondName,
      params!.userThirdName,
      params!.phoneNumber
    );
  }
}