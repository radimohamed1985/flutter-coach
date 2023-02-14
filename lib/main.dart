import 'package:coach/homepage/home_page.dart';
import 'package:coach/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        HomePage.id: (context) => HomePage()
      },
      home: SplashPage(),
    );
  }
}
