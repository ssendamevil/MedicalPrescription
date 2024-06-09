import 'package:dio/dio.dart';
import 'package:medical_prescription/config/constants/constants.dart';
import 'package:medical_prescription/data/models/medicament.dart';
import 'package:retrofit/retrofit.dart';

part 'medicament_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class MedicamentApiService{
  factory MedicamentApiService(Dio dio) = _MedicamentApiService;

  @GET('/medicament/getByTagId/{id}')
  Future<HttpResponse<List<MedicamentModel>>> getMedicamentByTagId(@Path("id") int id);

  @GET('/medicament/getAllMedsByCategory/{name}')
  Future<HttpResponse<List<MedicamentModel>>> getMedicamentByCategory(@Path("name") String name);
}