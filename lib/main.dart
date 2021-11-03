import 'package:flutter/material.dart';
import 'package:study_flutter_30days/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Material(
        child: HomePage()
      ),
    );
  }
}
