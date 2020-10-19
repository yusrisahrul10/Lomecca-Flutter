import 'package:pos_flutter/src/model/restaurant.dart';

abstract class Repository {
  Future<Restaurants> getRestaurant(
      [double latitude,
        double longitude,
        double radius]);
}