import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_myapp/entity/data.dart';
import 'package:flutter_application_myapp/entity/until.dart';

class WeatherWeek extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const WeatherWeek({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var fullDate = Util.
    return Container(
      child: ListView.separated(
        separatorBuilder: ((context, index) => SizedBox(
              height: 8,
            )),
        itemCount: snapshot.data!.list!.length,
        itemBuilder: ((context, index) => Container(
              width: 15,
              height: 150,
              child: card(snapshot, index),
            )),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

Widget card(AsyncSnapshot snapshot, int index) {
  var _datte = snapshot.data?.list?[index].dt;
  var _temp = snapshot.data?.list?[index].temp.day.toInt();
  DateTime date = DateTime.fromMillisecondsSinceEpoch(_datte! * 1000);
  var _fullDate = Unil.getFormatDate(date);
  var _dayWeek = Unil.getFormatDateWeek(date);
  var _city = snapshot.data?.city?.name;
  //var _icon = snapshot.data?.list?[index].getIconUrl();

  return Card(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color.fromARGB(100, 22, 44, 33),
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        //Image.network(_icon, scale: 1.2, color: Colors.red),
        Text(
          '$_fullDate ',
          style: TextStyle(fontSize: 20, color: Colors.white60),
        ),
        Text(
          '$_dayWeek ',
          style: TextStyle(fontSize: 20, color: Colors.white60),
        ),
        Text(
          '$_temp°C',
          style: TextStyle(fontSize: 25, color: Colors.white70),
        ),
        Text(
          '$_city',
          style: TextStyle(fontSize: 25, color: Colors.white70),
        ),
      ],
    ),
  );
}
