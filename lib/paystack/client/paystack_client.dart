import 'package:dio/dio.dart';
import 'package:hostels/paystack/models/create_payment_request.dart';
import 'package:hostels/paystack/models/create_payment_response.dart';
import 'package:hostels/paystack/models/verify_payment_response.dart';
import 'package:retrofit/retrofit.dart';

part 'paystack_client.g.dart';

@RestApi(baseUrl: "https://api.paystack.co")
abstract class PaystackClient {
  factory PaystackClient(Dio dio, {String baseUrl}) = _PaystackClient;

  @POST("/transaction/initialize")
  Future<CreatePaymentResponse> createPayment(
    @Body() CreatePaymentRequest req,
  );

  @GET("/transaction/verify/{reference}")
  Future<VerifyPaymentResponse> verifyPayment(
    @Path("reference") String reference,
  );
}
