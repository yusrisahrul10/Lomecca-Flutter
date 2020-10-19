import 'package:pos_flutter/src/model/restaurant.dart';
import 'package:pos_flutter/src/network/api/rest_client.dart';

import '../repository.dart';
import 'package:dio/dio.dart';


class ApiRepository implements Repository {

  Dio _dio;
  RestClient _restClient;

  ApiRepository() {
    _dio = Dio();
    _restClient = RestClient(_dio);
  }


  @override
  Future<Restaurants> getRestaurant(
      [double latitude,
        double longitude,
        double radius]) {
    return _restClient.getRestauran(latitude, longitude, radius);
  }

}