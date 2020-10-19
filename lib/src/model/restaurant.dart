import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurants extends Equatable {

  @JsonKey(name: 'restaurants')
  final List<RestaurantElement> restaurants;

  const Restaurants([this.restaurants = const []]);

  @override
  List<Object> get props => [restaurants];

  factory Restaurants.fromJson(Map<String, dynamic> json) => _$RestaurantsFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantsToJson(this);
}

@JsonSerializable()
class RestaurantElement extends Equatable {

  @JsonKey(name: 'restaurant')
  final Restaurant restaurant;

  RestaurantElement(this.restaurant);

  @override
  List<Object> get props => [restaurant];

  factory RestaurantElement.fromJson(Map<String, dynamic> json) => _$RestaurantElementFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantElementToJson(this);

}

@JsonSerializable()
class Restaurant extends Equatable {

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'featured_image')
  final String featuredImage;

  @JsonKey(name: 'location')
  final Location location;

  Restaurant(
      this.id,
      this.name,
      this.featuredImage,
      this.location
      );
  @override
  List<Object> get props => [
    id,
    name,
    featuredImage,
    location
  ];

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

}

@JsonSerializable()
class Location extends Equatable {

  @JsonKey(name: 'address')
  final String address;

  Location(this.address);

  @override
  List<Object> get props => [
    address
  ];

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

}