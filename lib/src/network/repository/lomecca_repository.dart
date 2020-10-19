import 'package:flutter/material.dart';
import 'package:pos_flutter/src/model/restaurant.dart';
import 'package:pos_flutter/src/network/repository/remote/api_repository.dart';
import 'package:pos_flutter/src/network/repository/repository.dart';

import 'local/local_repository.dart';

class LomeccaRepository implements Repository {
  final ApiRepository apiRepository;
  final LocalRepository localRepository;

  static final LomeccaRepository _singleton = LomeccaRepository._internal(
      apiRepository: ApiRepository(), localRepository: LocalRepository());

  factory LomeccaRepository() {
    return _singleton;
  }

  LomeccaRepository._internal(
      {@required this.apiRepository, @required this.localRepository});

  @override
  Future<Restaurants> getRestaurant([double latitude, double longitude, double radius])
  async {
    try {
      var fromLocal =
          await localRepository.getRestaurant(latitude, longitude, radius);
      if (fromLocal != null) {
        return fromLocal;
      } else {
        throw Exception();
      }
    } catch (_) {
      final data = await apiRepository.getRestaurant(latitude, longitude, radius);
      localRepository.saveRestaurant(data);
      return data;
    }
  }

}