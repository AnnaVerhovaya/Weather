
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_myapp/entity/data.dart';
import 'package:flutter_application_myapp/entity/res.dart';
import 'package:flutter_application_myapp/entity/until.dart';
import 'package:flutter_application_myapp/widgets/second.dart';
import 'package:flutter_application_myapp/widgets/weather_week.dart';

import 'auth_widget.dart';
import 'main_image.dart';

class CitySreen extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CitySreen({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 1);
    final colorAut = Color.fromARGB(213, 185, 106, 3);
    var _city = snapshot.data?.city?.name;
    var _date = snapshot.data?.list?[0].dt;
    var _formatedDate =
        DateTime.fromMillisecondsSinceEpoch(_date!.toInt() * 1000);
    var _temp = snapshot.data?.list?[0].temp?.day?.toInt();
    var _description = snapshot.data?.list?[0].weather?[0].description;
    var pressure = snapshot.data?.list?[0].pressure;
    var wind = snapshot.data?.list?[0].speed;
    var humidity = snapshot.data?.list?[0].humidity;

    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '$_description',
                    style: TextStyle(
                      fontSize: 32,
                      color: colorAut,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _temp!<5
              ? Text(
                    '$_temp℃',
                    style: TextStyle(
                      fontSize: 60,
                      color: Color.fromARGB(255, 72, 153, 219),
                    )):
                  Text(
                    '$_temp℃',
                    style: TextStyle(
                      fontSize: 60,
                      color: colorAut,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$_city',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(239, 124, 61, 6),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${Unil.getFormatDate(_formatedDate)},',
                    style: TextStyle(fontSize: 25, color: colorAut),
                  ),
                  SladeRowhWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  MainImade(
                    snapshot: snapshot,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Wind',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 18),
                        ),
                        Text(
                          '$wind',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 18),
                        ),
                        Text(
                          'km/h',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 18),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 70,
                              color: Colors.grey.shade300,
                            ),
                            Container(
                              height: 5,
                              width: 40,
                              color: Colors.green,
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Pressure',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 18),
                        ),
                        Text(
                          '$pressure',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 18),
                        ),
                        Text(
                          'Pa',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 18),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 70,
                              color: Colors.grey.shade300,
                            ),
                            Container(
                              height: 5,
                              width: 40,
                              color: Colors.red,
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Humidity',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 18),
                        ),
                        Text(
                          '$humidity',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 18),
                        ),
                        Text(
                          'r/m',
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 18),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 70,
                              color: Colors.grey.shade300,
                            ),
                            Container(
                              height: 5,
                              width: 40,
                              color: Color.fromARGB(255, 30, 65, 170),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
