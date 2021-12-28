import 'package:flutter/material.dart';
import 'package:study_flutter_30days/pages/car_page.dart';
import 'package:study_flutter_30days/pages/home_page.dart';
import 'package:study_flutter_30days/pages/login_page.dart';
import 'package:study_flutter_30days/utils/routes.dart';
import 'package:study_flutter_30days/values/app_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: Colors.black),
              toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
              titleTextStyle: Theme.of(context).textTheme.headline6),
          fontFamily: AppFonts.latoRegular,
          primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.cartRoute: (context) => const CarPage(),
      },
    );
  }
}
