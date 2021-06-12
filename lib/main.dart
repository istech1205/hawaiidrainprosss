import 'package:flutter/material.dart';
import 'package:hawaiidrainpros/screens/splash.dart';
import 'package:hawaiidrainpros/utils/Const.dart';
import 'package:hawaiidrainpros/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appname,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'cali_font',
        scaffoldBackgroundColor: appcolor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
      },
    );
  }
}
