
import 'package:dio/dio.dart' hide Headers;
import 'package:pos_flutter/src/model/restaurant.dart';
import 'package:pos_flutter/src/network/api/api_constant.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestClient {
    factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

    @GET("/search")
    @Headers(<String, dynamic>{
        'user-key' : '76def1a6e926abd4c356ec9f67885ade'
    })
    Future<Restaurants> getRestauran(
        @Query("lat") double latitude, @Query("lon") double longitude,
        @Query("radius") double radius);
}