import 'package:dio/dio.dart';
import 'package:medical_prescription/config/constants/constants.dart';
import 'package:medical_prescription/data/models/prescription.dart';
import 'package:retrofit/retrofit.dart';

part 'prescription_api_service.g.dart';

@RestApi(baseUrl: ApiBaseUrl)
abstract class PrescriptionApiService{
  factory PrescriptionApiService(Dio dio) = _PrescriptionApiService;

  @GET('/prescription/findAllPresByPatient')
  Future<HttpResponse<List<PrescriptionModel>>> getAllPrescriptions(
    @Header('Authorization') String token
  );

}