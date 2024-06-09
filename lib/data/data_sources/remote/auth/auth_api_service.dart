import 'package:dio/dio.dart';
import 'package:medical_prescription/config/constants/constants.dart';
import 'package:medical_prescription/data/models/user.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api_service.g.dart';


@RestApi(baseUrl: apiBaseUrl)
abstract class AuthApiService{
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/auth')
  Future<HttpResponse<UserModel>> loginUser({
    @Field("iin") required String iin,
    @Field("password") required String password,
  });

  @POST('/registration')
  Future<HttpResponse<UserModel>> registerUser({
    @Field("username") required String username,
    @Field("userSecondName") required String userSecondName,
    @Field("userThirdName") required String userThirdName,
    @Field("password") required String password,
    @Field("confirmPassword") required String confirmPassword,
    @Field("iin") required String iin,
    @Field("phone_number") required String phone_number,
  });
}