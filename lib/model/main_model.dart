import 'package:flutter/material.dart';
import 'package:flutter_application_myapp/api/api_client.dart';

import '../entity/data.dart';

class MainModel extends ChangeNotifier {
  final _apiClient = WeatherApi();
  final _cityName = 'London';

  Future<WeatherForecast> loadWeather() async {
    return await _apiClient.featchWeatherForecast(cityName: 'London');
  }
}

class MainModelProvider extends InheritedNotifier {
  final MainModel model;
  const MainModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static MainModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainModelProvider>();
  }

  static MainModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<MainModelProvider>()
        ?.widget;
    return widget is MainModelProvider ? widget : null;
  }
}
