import 'package:flutter/material.dart';

import 'navigation/mainNavigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //final model = MyAppModel();
 // model.isAuth;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
 // final MyAppModel model;
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.amber,
        ),
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
      ),
      routes: mainNavigation.routes,
      //initialRoute: mainNavigation.initialRoute(model.isAuth),
     // onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}