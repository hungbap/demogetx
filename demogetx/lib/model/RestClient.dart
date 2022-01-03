import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'auto.dart';
part 'RestClient.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('/v1/memes/')
  Future<Autogenerated> getContact(@Queries() Map<String, dynamic> map);
}
