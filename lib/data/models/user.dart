import 'package:medical_prescription/domain/entities/user/user.dart';

class UserModel extends UserEntity{
  const UserModel({
    required super.name,
    required super.iin,
    required super.token
  });

  factory UserModel.fromJson(Map<String, dynamic> map){
    return UserModel(
      name: map["name"] ?? "",
      iin: map["iin"] ?? "",
      token: map["token"] ?? ""
    );
  }

}