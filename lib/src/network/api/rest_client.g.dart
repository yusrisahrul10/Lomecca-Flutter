// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://developers.zomato.com/api/v2.1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Restaurants> getRestauran(latitude, longitude, radius) async {
    ArgumentError.checkNotNull(latitude, 'latitude');
    ArgumentError.checkNotNull(longitude, 'longitude');
    ArgumentError.checkNotNull(radius, 'radius');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lat': latitude,
      r'lon': longitude,
      r'radius': radius
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/search',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{
              r'user-key': '76def1a6e926abd4c356ec9f67885ade'
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Restaurants.fromJson(_result.data);
    return value;
  }
}
