import 'dart:convert';

import 'package:pos_flutter/src/model/restaurant.dart';
import 'package:pos_flutter/src/network/repository/repository.dart';
import 'package:pos_flutter/utils/pref_helper.dart';
import 'package:pos_flutter/utils/utils.dart';

class LocalRepository implements Repository {

  @override
  Future<Restaurants> getRestaurant(
      [double latitude,
        double longitude,
        double radius]) async {
    var fromCache = await PrefHelper.getCache(AppConstants.RESTAURANT);
    if (fromCache != null) {
      Map json = jsonDecode(fromCache);
      return Restaurants.fromJson(json);
    }
    return null;
  }

  Future<bool> saveRestaurant(Restaurants restaurant) {
      return PrefHelper.storeCache(AppConstants.RESTAURANT, jsonEncode(restaurant));
  }
  
}