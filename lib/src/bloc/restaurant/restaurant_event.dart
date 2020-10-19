import 'package:equatable/equatable.dart';

abstract class RestaurantEvent extends Equatable {
    const RestaurantEvent();

    @override
    List<Object> get props => [];

}

class LoadRestaurant extends RestaurantEvent {}