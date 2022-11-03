import 'package:flutter/material.dart';
import 'package:flutter_application_myapp/widgets/auth_widget.dart';

import '../widgets/city_screen.dart';
import '../widgets/main_screen.dart';
import '../widgets/second.dart';

abstract class MainNavigationRoutesNames {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const search = 'search';

}

class MainNavigation{
  final routes = <String, Widget Function(BuildContext)>{
    //MainNavigationRoutesNames.auth: (context) => SladeRowhWidget(),
    MainNavigationRoutesNames.mainScreen: (context) => MainScreen(),
   
  };
}


