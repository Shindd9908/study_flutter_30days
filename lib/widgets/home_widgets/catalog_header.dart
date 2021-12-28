import 'package:flutter/material.dart';
import 'package:study_flutter_30days/values/app_theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(AppTheme.darkBluishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}