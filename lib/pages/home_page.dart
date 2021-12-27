import 'package:flutter/material.dart';
import 'package:study_flutter_30days/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  final int days = 30;
  final String name = "Shindd";

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Center(
        child: Text("Welcome to $days days of Flutter by " + name), 
        ),
      drawer: MyDrawer(),
    );
  }
}