// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurants _$RestaurantsFromJson(Map<String, dynamic> json) {
  return Restaurants(
    (json['restaurants'] as List)
        ?.map((e) => e == null
            ? null
            : RestaurantElement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RestaurantsToJson(Restaurants instance) =>
    <String, dynamic>{
      'restaurants': instance.restaurants,
    };

RestaurantElement _$RestaurantElementFromJson(Map<String, dynamic> json) {
  return RestaurantElement(
    json['restaurant'] == null
        ? null
        : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestaurantElementToJson(RestaurantElement instance) =>
    <String, dynamic>{
      'restaurant': instance.restaurant,
    };

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    json['id'] as String,
    json['name'] as String,
    json['featured_image'] as String,
    json['location'] == null
        ? null
        : Location.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'featured_image': instance.featuredImage,
      'location': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    json['address'] as String,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'address': instance.address,
    };
