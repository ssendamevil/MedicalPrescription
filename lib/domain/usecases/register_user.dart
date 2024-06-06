import 'package:medical_prescription/core/resources/data_state.dart';
import 'package:medical_prescription/core/usecases/usecase.dart';
import 'package:medical_prescription/domain/entities/user.dart';

class RegisterUser implements UseCase<DataState<UserEntity>, void>{
  @override
  Future<DataState<UserEntity>> call({void params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
  
}