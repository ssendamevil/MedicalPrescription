import 'package:dio/dio.dart';
import 'package:medical_prescription/config/constants/constants.dart';
import 'package:medical_prescription/data/models/order.dart';
import 'package:retrofit/retrofit.dart';

part 'order_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class OrderApiService{
  factory OrderApiService(Dio dio) = _OrderApiService;

  @POST('/order/create')
  Future<HttpResponse<OrderModel>> createOrder({
    @Field("medicaments") required List<int> medicaments,
    @Field("prescriptionId") required int prescriptionId,
  });

  @GET('/order/getOrdersByPatientId')
  Future<HttpResponse<List<OrderModel>>> getAllPatientOrders(
      @Header('Authorization') String token
  );

}