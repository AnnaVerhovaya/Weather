import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_myapp/entity/res.dart';

import '../entity/data.dart';

class MainImade extends StatefulWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const MainImade({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  State<MainImade> createState() => _MainImadeState();
}

class _MainImadeState extends State<MainImade> {
  @override
  Widget build(BuildContext context) {
    var _description = widget.snapshot.data?.list?[0].weather?[0].description.toString();
   var a =  _description.toString().contains('rain');
   var b =  _description.toString().contains('snow');
   var v =  _description.toString().contains('clouds');
    return Container(child: 
          a==true
              ? Container(
                width: MediaQuery.of(context).size.width *0.65,
                //height: MediaQuery.of(context).size.width *0.45,
                child: Image.asset(AppImages.rain)):
          b==true
              ? Container(
                width: MediaQuery.of(context).size.width *0.65,
                height: MediaQuery.of(context).size.width *0.45,
                child: Image.asset(AppImages.winter)):
          v==true
              ? Container(
                width: MediaQuery.of(context).size.width *0.65,
                child: Image.asset(AppImages.windy))
              : Container(
                 width: MediaQuery.of(context).size.width *0.65,
                height: MediaQuery.of(context).size.width *0.45,
                child: Image.asset(AppImages.hello)),
          
      
    );
    
  }
}
