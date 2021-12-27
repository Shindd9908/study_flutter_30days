import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          fontFamily: AppFonts.latoRegular, primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
      },
    );
  }
}
