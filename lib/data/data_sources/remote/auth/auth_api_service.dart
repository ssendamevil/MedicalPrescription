import 'package:dio/dio.dart';
import 'package:medical_prescription/config/constants/constants.dart';
import 'package:medical_prescription/data/models/user.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api_service.g.dart';


@RestApi(baseUrl: ApiBaseUrl)
abstract class AuthApiService{
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/auth')
  Future<HttpResponse<UserModel>> loginUser({
    @Field("username") required String username,
    @Field("password") required String  password,
  });
}