import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_myapp/entity/data.dart';
import 'package:flutter_application_myapp/widgets/weather_week.dart';

import '../entity/res.dart';

class Searchwidget extends StatefulWidget {
  const Searchwidget({
    Key? key,
  }) : super(key: key);

  @override
  State<Searchwidget> createState() => _SearchwidgetState();
}

class _SearchwidgetState extends State<Searchwidget> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(''),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            AppImages.forest,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
            children: [
              SizedBox(
                height: 300,
              ),
              TextField(
                onChanged: (value) {
                  cityName = value;
                },
                decoration: const InputDecoration(
                  hintText: ('Введите название города'),
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: const Text(
                    'GO',
                    style: TextStyle(color: Colors.grey, fontSize: 50),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
