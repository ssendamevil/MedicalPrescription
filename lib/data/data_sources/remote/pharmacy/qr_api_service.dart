import 'package:dio/dio.dart';
import 'package:medical_prescription/config/constants/constants.dart';
import 'package:medical_prescription/data/models/order.dart';
import 'package:retrofit/retrofit.dart';

part 'qr_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class QrApiService{
  factory QrApiService(Dio dio) = _QrApiService;

  @GET('/order/scanQrCode/{token}')
  Future<HttpResponse<OrderModel>> scanQrCode(@Path("token") String token);
}