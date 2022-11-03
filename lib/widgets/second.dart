import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_myapp/widgets/search_screen.dart';
import 'package:flutter_application_myapp/widgets/weather_week.dart';

import '../entity/data.dart';
import '../entity/res.dart';

class SecondWidget extends StatefulWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const SecondWidget({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  State<SecondWidget> createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(''),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return Searchwidget();
              }));
            }),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return Searchwidget();
              }));
            },
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.forest,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          WeatherWeek(
            snapshot: widget.snapshot,
          ),
        ],
      ),
    );
  }
}
