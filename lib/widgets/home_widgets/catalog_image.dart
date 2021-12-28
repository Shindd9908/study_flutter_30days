import 'package:flutter/material.dart';
import 'package:study_flutter_30days/values/app_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  const CatalogImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(AppTheme.creamColor).make().p16().w40(context);
  }
}