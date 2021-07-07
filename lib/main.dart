import 'package:flutter/material.dart';
import 'package:flutter_app_dogspath/screens/screens.dart';
import 'package:get/get.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
      routes: {
        //'/landingPage': (context) => LandinPage(),
        '/loginScreen': (context) => LoginScreen(),
        '/landingPage' : (context) =>LandingPage(),
      },
    );
  }
}
