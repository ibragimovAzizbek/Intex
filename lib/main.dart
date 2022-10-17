import 'package:flutter/material.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intex Market',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ColorConst.backgroundColor,
      ),
      initialRoute: '/home',
      onGenerateRoute: RouteCont.inherentce.onGenerateRoute,
    );
  }
}
