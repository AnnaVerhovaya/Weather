import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_myapp/api/api_client.dart';
import 'package:flutter_application_myapp/entity/data.dart';
import 'package:flutter_application_myapp/widgets/search_screen.dart';
import 'package:flutter_application_myapp/widgets/second.dart';
import 'city_screen.dart';
import 'main_image.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<WeatherForecast> forecastObject;
  late String _cityName = 'Abakan';
  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().featchWeatherForecast(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        //  extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Search City',
            style: TextStyle(color: Colors.grey),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                var tapName = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return Searchwidget();
                }));
                if (tapName != null) {
                setState(() {
                  _cityName = tapName as String;
                  forecastObject = WeatherApi()
                      .featchWeatherForecast(cityName: _cityName);
                });
                }
              },
              icon: Icon(Icons.search),
              iconSize: 30,
              color: Colors.grey,
            ),
          ],
        ),
        body: FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PageView(
                  children: [
                    CitySreen(
                      snapshot: snapshot,
                    ),
                    SecondWidget(
                      snapshot: snapshot,
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
