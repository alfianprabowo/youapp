import 'package:youapp/app/utils/constants/app_const.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';
import 'response_status.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("api/login")
  Future<ResponseStatus> login(
    @Body() Map<String, dynamic> data,
  );

  @POST("api/register")
  Future<ResponseStatus> register(
    @Body() Map<String, dynamic> data,
  );

  @PATCH("api/updateProfile")
  Future<ResponseStatus> updateProfile(
    @Body() Map<String, dynamic> data,
  );

  @GET("api/getProfile")
  Future<ResponseStatus> getProfile();

  @POST("api/createProfile")
  Future<ResponseStatus> createProfile(
    @Body() Map<String, dynamic> data,
  );
}
