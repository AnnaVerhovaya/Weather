import 'dart:convert';
import 'dart:io';
import '../entity/data.dart';
import 'package:http/http.dart' as http;

import 'contains.dart';


class WeatherApi {
  Future<WeatherForecast> featchWeatherForecast(
      {required String cityName}) async {
    var queryParam = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };
    var uri = Uri.http(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParam);
    //log('recuest:${uri.toString()}');
    var responce = await http.get(uri);
    print('responce:${responce.body}');
    if (responce.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(responce.body));
    } else {
      throw Exception('Error');
    }
  }
}




















/*class ApiClient {

  static const _weatherId = '1369dd6b5ae78fc9952261ab9aa236b4';
  static const _http = 'https://';
  static const _url = 'api.openweathermap.org';
  static const _forecastPath = '/data/2.5/forecast/daily';
  static const _imagePath = '/img/w/';
  static const _imageUrl = _http + _url + _imagePath;

  Future<WeatherForecast> loadWeatherForName(String cityName) async {
    var _parametrs = {
      'AppId': _weatherId,
      'units': 'metric',
      'q': cityName,
    };
    var uri = Uri.http(_url, _forecastPath, _parametrs);
    var response = await http.get(uri);
     if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }
  }
 */