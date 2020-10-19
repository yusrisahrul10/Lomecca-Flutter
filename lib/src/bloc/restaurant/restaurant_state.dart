import 'package:equatable/equatable.dart';
import 'package:pos_flutter/src/model/restaurant.dart';

abstract class RestaurantState extends Equatable {
    const RestaurantState();

    @override
    List<Object> get props => [];
}

class InitialRestaurant extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantHasData extends RestaurantState {
    final Restaurants restaurants;

    const RestaurantHasData([this.restaurants]);

    @override
    List<Object> get props => [restaurants];
}

class RestaurantNoData extends RestaurantState {
  final String message;

  const RestaurantNoData(this.message);

  @override
  List<Object> get props => [message];
}

class RestaurantNoInternetConnection extends RestaurantState {}

class RestaurantError extends RestaurantState {
  final String errorMessage;

  const RestaurantError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}