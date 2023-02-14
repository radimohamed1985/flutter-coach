import 'package:coach/constant/constant.dart';
import 'package:coach/homepage/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static String id = 'SplashPage';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, 'HomePage');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    final myheight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.blue[100],
      height: myheight,
    );
  }
}
