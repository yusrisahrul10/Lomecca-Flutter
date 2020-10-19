import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:pos_flutter/src/bloc/restaurant/restaurant_event.dart';
import 'package:pos_flutter/src/bloc/restaurant/restaurant_state.dart';
import 'package:pos_flutter/src/network/repository/repository.dart';
import 'package:pos_flutter/utils/utils.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final Repository repository;

  RestaurantBloc({this.repository}) : super(InitialRestaurant());

  @override
  Stream<RestaurantState> mapEventToState(RestaurantEvent event) async*{
    if (event is LoadRestaurant) {
      yield* _mapLoadRestaurantToState();
    }
  }

  Stream<RestaurantState> _mapLoadRestaurantToState() async* {
    try {
      yield RestaurantLoading();
      var restaurant = await repository.getRestaurant(
          -6.1515997, 106.8925063, 200);
      if (restaurant.restaurants.isEmpty) {
        yield RestaurantNoData(AppConstants.noData);
      } else {
        yield RestaurantHasData(restaurant);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        yield RestaurantNoInternetConnection();
      } else if (e.type == DioErrorType.DEFAULT) {
        yield RestaurantNoInternetConnection();
      } else {
        yield RestaurantError(e.toString());
      }
    }
  }
  
}