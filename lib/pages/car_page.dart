import 'package:flutter/material.dart';
import 'package:study_flutter_30days/values/app_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CarPage extends StatelessWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
    );
  }
}
